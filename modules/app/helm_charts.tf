provider "helm" {
  kubernetes {
    host = var.eks_cluster.endpoint
    cluster_ca_certificate = base64decode(var.eks_cluster.certificate_authority.0.data)
    exec {
      api_version = "client.authentication.k8s.io/v1alpha1"
      args        = ["eks", "get-token", "--cluster-name", var.cluster_name]
      command     = "aws"
    }
  }
}

resource "helm_release" "helm_prometheus" {
  name  = "prometheus"
  chart = "kube-prometheus-stack"
  repository = "https://prometheus-community.github.io/helm-charts"
  namespace = "monitoring"
  create_namespace = true

  values = [
    "${file("prometheus_values.yaml")}"
  ]
}

resource "helm_release" "helm_goldpinger" {
  name  = "goldpinger"
  chart = "goldpinger"
  repository = "https://okgolove.github.io/helm-charts/"
  namespace = "monitoring"
  create_namespace = true

  values = [
    "${file("goldpinger_values.yaml")}"
  ]
  depends_on = [helm_release.helm_prometheus]
}
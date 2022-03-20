terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.73.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "2.4.1"
    }
  }
  required_version = "1.0.8"
}

provider "aws" {
  region = var.aws_region
}

provider "helm" {
  kubernetes {
    host = module.master.eks_cluster.endpoint
    cluster_ca_certificate = base64decode(module.master.eks_cluster.certificate_authority)
    exec {
      api_version = "client.authentication.k8s.io/v1alpha1"
      args        = ["eks", "get-token", "--cluster-name", module.master.eks_cluster]
      command     = "aws"
    }
  }
}

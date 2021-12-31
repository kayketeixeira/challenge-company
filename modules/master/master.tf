resource "aws_eks_cluster" "eks_cluster" {
  name     = var.cluster_name
  version  = var.eks_version
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    security_group_ids = [
      aws_security_group.cluster-master-sg.id
    ]
    subnet_ids = [
      var.private_subnet_2a.id,
      var.private_subnet_2b.id
    ]
  }
  tags = {
    "kubernetes.io/cluster/eks-cluster-kayke" = "shared"
  }
}


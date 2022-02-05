resource "aws_eks_node_group" "node_group" {
  cluster_name    = var.eks_cluster.name
  node_role_arn   = aws_iam_role.eks_node_role.arn
  node_group_name = format("%s_eks-node-group", var.cluster_name)

  subnet_ids = [
    var.private_subnet_2a.id,
    var.private_subnet_2b.id
  ]

  instance_types = var.node_instances_sizes

  scaling_config {
    desired_size = lookup(var.auto_scale_options, "desired")
    max_size     = lookup(var.auto_scale_options, "max")
    min_size     = lookup(var.auto_scale_options, "min")
  }

  tags = {
    "kubernetes.io/cluster/eks-cluster-kayke" = "owned"
  }
}
module "network" {
  source = "./modules/network"

  cluster_name = var.cluster_name
  aws_region   = var.aws_region
}

module "master" {
  source = "./modules/master"

  cluster_name      = var.cluster_name
  aws_region        = var.aws_region
  eks_version       = var.eks_version

  cluster_vpc       = module.network.cluster_vpc
  private_subnet_2a = module.network.private_subnet_2a
  private_subnet_2b = module.network.private_subnet_2b
}

module "nodes" {
  source = "./modules/nodes"

  cluster_name = var.cluster_name
  aws_region   = var.aws_region
  eks_version  = var.eks_version

  cluster_vpc       = module.network.cluster_vpc
  private_subnet_2a = module.network.private_subnet_2a
  private_subnet_2b = module.network.private_subnet_2b

  eks_cluster    = module.master.eks_cluster
  eks_cluster_sg = module.master.security_group

  node_instances_sizes = var.node_instances_sizes
  auto_scale_options   = var.auto_scale_options

}

module "app" {
  source         = "./modules/app"

  cluster_name   = var.cluster_name

  eks_cluster    = module.master.eks_cluster
}
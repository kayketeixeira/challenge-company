variable "cluster_name" {
  default = "eks-cluster-kayke"
}

variable "aws_region" {
  default = "us-west-2"
}

variable "eks_version" {
  default = "1.21"
}

variable "node_instances_sizes" {
  default = [
    "t2.micro"
  ]
}

variable "auto_scale_options" {
  default = {
    min     = 2
    max     = 10
    desired = 2
  }
}


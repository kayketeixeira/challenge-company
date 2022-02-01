terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.73.0"
    }
  }
  required_version = "1.0.8"
}

provider "aws" {
  region = var.aws_region
}


output "cluster_vpc" {
  value = aws_vpc.cluster_vpc
}

output "private_subnet_2a" {
  value = aws_subnet.aws_private_subnet_2a
}

output "private_subnet_2b" {
  value = aws_subnet.aws_private_subnet_2b
}

output "public_subnet_2a" {
  value = aws_subnet.aws_public_subnet_2a
}

output "public_subnet_2b" {
  value = aws_subnet.aws_public_subnet_2b
}


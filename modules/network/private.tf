resource "aws_subnet" "aws_private_subnet_2a" {
  vpc_id = aws_vpc.cluster_vpc.id

  cidr_block              = "10.0.11.0/24"

  availability_zone       = "us-west-2a"

  tags = {
    Name = "eks-cluster-kayke_private-subnet_2a",
    "kubernetes.io/cluster/eks-cluster-kayke" = "shared"
  }
}

resource "aws_subnet" "aws_private_subnet_2b" {
  vpc_id = aws_vpc.cluster_vpc.id

  cidr_block              = "10.0.12.0/24"

  availability_zone       = "us-west-2b"

  tags = {
    Name = "eks-cluster-kayke_private-subnet_2b"
    "kubernetes.io/cluster/eks-cluster-kayke" = "shared"
  }
}

resource "aws_route_table_association" "subnet-private_2a" {
  subnet_id      = aws_subnet.aws_private_subnet_2a.id
  route_table_id = aws_route_table.nat-private.id
}

resource "aws_route_table_association" "subnet-private_2b" {
  subnet_id      = aws_subnet.aws_private_subnet_2b.id
  route_table_id = aws_route_table.nat-private.id
}
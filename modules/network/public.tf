resource "aws_subnet" "aws_public_subnet_2a" {
  vpc_id = aws_vpc.cluster_vpc.id

  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-west-2a"

  tags = {
    Name = "eks-cluster-kayke_public-subnet_2a"
    "kubernetes.io/cluster/eks-cluster-kayke" = "shared"
  }
}

resource "aws_subnet" "aws_public_subnet_2b" {
  vpc_id = aws_vpc.cluster_vpc.id

  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-west-2b"

  tags = {
    Name = "eks-cluster-kayke_public-subnet_2b"
    "kubernetes.io/cluster/eks-cluster-kayke" = "shared"
  }
}

resource "aws_route_table_association" "subnet-public_2a" {
  subnet_id      = aws_subnet.aws_public_subnet_2a.id
  route_table_id = aws_route_table.igw_route_table.id
}

resource "aws_route_table_association" "subnet-public_2b" {
  subnet_id      = aws_subnet.aws_public_subnet_2b.id
  route_table_id = aws_route_table.igw_route_table.id
}

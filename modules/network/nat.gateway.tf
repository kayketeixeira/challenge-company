resource "aws_eip" "vpc_eip" {
  vpc  = true

  tags = {
    Name = "eks-cluster-kayke_eip"
  }
}

resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.vpc_eip.id
  subnet_id     = aws_subnet.aws_public_subnet_2a.id

  tags = {
    Name = "eks-cluster-kayke_nat-gateway"
  }

  depends_on = [aws_eip.vpc_eip]
}

resource "aws_route_table" "nat-private" {
  vpc_id = aws_vpc.cluster_vpc.id

  tags = {
    Name = "eks-cluster-kayke_Private-route"
  }
}

resource "aws_route" "nat-access" {
  route_table_id         = aws_route_table.nat-private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat-gw.id
}


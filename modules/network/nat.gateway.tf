resource "aws_eip" "vpc_eip" {
  vpc  = true

  tags = {
    Name = format("%s_vpc_eip", var.cluster_name)
  }
}

resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.vpc_eip.id
  subnet_id     = aws_subnet.aws_public_subnet_2a.id

  tags = {
    Name = format("%s_nat-gateway", var.cluster_name)
  }

  depends_on = [aws_eip.vpc_eip]
}

resource "aws_route_table" "nat-private" {
  vpc_id = aws_vpc.cluster_vpc.id

  tags = {
    Name = format("%s_Private_route", var.cluster_name)
  }
}

resource "aws_route" "nat-access" {
  route_table_id         = aws_route_table.nat-private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat-gw.id
}

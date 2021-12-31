resource "aws_security_group" "cluster-master-sg" {
  name   = "eks-cluster-kayke_master-SG"
  vpc_id = var.cluster_vpc.id

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "eks-cluster-kayke_master-SG"
  }
}

resource "aws_security_group_rule" "cluster_ingress_https" {
  type              = "ingress"
  cidr_blocks       = ["177.11.155.14/32"]
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.cluster-master-sg.id
}

resource "aws_security_group_rule" "cluster_ingress_ssh" {
  type              = "ingress"
  cidr_blocks       = ["177.11.155.14/32"]
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.cluster-master-sg.id
}

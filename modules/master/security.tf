resource "aws_security_group" "cluster-master-sg" {
  name   = format("%s_master-SG", var.cluster_name)
  vpc_id = var.cluster_vpc.id

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = format("%s_master-SG", var.cluster_name)
  }
}

#resource "aws_security_group_rule" "cluster_ingress_https" {
  #type              = "ingress"
  #cidr_blocks       = ["191.7.84.12/32"]
  #from_port         = 443
  #to_port           = 443
  #protocol          = "tcp"
  #security_group_id = aws_security_group.cluster-master-sg.id
#}

#resource "aws_security_group_rule" "cluster_ingress_http" {
  #type              = "ingress"
  #cidr_blocks       = ["191.7.84.12/32"]
  #from_port         = 80
  #to_port           = 80
  #protocol          = "tcp"
  #security_group_id = aws_security_group.cluster-master-sg.id
#}

#resource "aws_security_group_rule" "cluster_ingress_ssh" {
  #type              = "ingress"
  #cidr_blocks       = ["191.7.84.12/32"]
  #from_port         = 22
  #to_port           = 22
 #protocol          = "tcp"
  #security_group_id = aws_security_group.cluster-master-sg.id
#}

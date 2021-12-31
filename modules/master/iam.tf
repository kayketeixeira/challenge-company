data "aws_iam_policy_document" "eks_cluster_role" {
  version = "2012-10-17"

  statement {

    actions = [
      "sts:AssumeRole"
    ]

    principals {
      identifiers = ["eks.amazonaws.com"]
      type        = "Service"
    }

  }

}

resource "aws_iam_role" "eks_cluster_role" {
  name               = "eks-cluster-kayke_eks-cluster-role"
  assume_role_policy = data.aws_iam_policy_document.eks_cluster_role.json
}

resource "aws_iam_role_policy_attachment" "eks_cluster_cluster" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_cluster_role.name
}

resource "aws_iam_role_policy_attachment" "eks_cluster_service" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = aws_iam_role.eks_cluster_role.name
}
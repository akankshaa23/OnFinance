resource "aws_eks_cluster" "eks" {
  name     = "OF-eks-cluster"
  role_arn = aws_iam_role.eks.arn
  vpc_config {
    subnet_ids = concat(aws_subnet.OF-subnets-public[*].id, aws_subnet.OF-subnets-private[*].id)
  }
}

resource "aws_eks_node_group" "node_group" {
  cluster_name  = aws_eks_cluster.eks.name
  node_role_arn = aws_iam_role.worker-node.arn
  subnet_ids    = aws_subnet.OF-subnets-private[*].id
  scaling_config {
    desired_size = 2
    min_size     = 1
    max_size     = 3
  }
}


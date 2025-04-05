resource "aws_eks_cluster" "eks" {
  name     = "OF-eks-cluster"
  role_arn = aws_iam_role.eks.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.OF-subnet-1.id,
      aws_subnet.OF-subnet-2.id
    ]
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.AmazonEKSServicePolicy
  ]
}

resource "aws_eks_node_group" "node_group" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = "OF-node-group"
  node_role_arn   = aws_iam_role.worker-node.arn
  subnet_ids      = [
    aws_subnet.OF-subnet-1.id,
    aws_subnet.OF-subnet-2.id
  ]

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

depends_on = [
  aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
  aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy
]

}


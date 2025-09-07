resource "aws_eks_node_group" "fullstack_app" {
  cluster_name    = aws_eks_cluster.fullstack_app.name
  node_group_name = "fullstack_app"
  node_role_arn   = aws_iam_role.eks_node_role.arn
  subnet_ids = [
    aws_subnet.fullstack_app1.id,
    aws_subnet.fullstack_app2.id,
    aws_subnet.fullstack_app3.id,
  ]
  capacity_type = "SPOT"

  scaling_config {
    desired_size = 1
    max_size     = 3
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role.eks_node_role,
  ]
}

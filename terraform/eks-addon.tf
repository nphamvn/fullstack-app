resource "aws_eks_addon" "fullstack_app_vpccni" {
  cluster_name  = aws_eks_cluster.fullstack_app.name
  addon_name    = "vpc-cni"
  addon_version = "v1.20.1-eksbuild.3"
}

resource "aws_eks_addon" "fullstack_app_kubeproxy" {
  cluster_name  = aws_eks_cluster.fullstack_app.name
  addon_name    = "kube-proxy"
  addon_version = "v1.33.3-eksbuild.6"
}

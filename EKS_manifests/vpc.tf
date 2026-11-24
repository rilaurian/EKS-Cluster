module "vpc" {
  source = "../VPC_manifests"

  environment_name = var.environment_name
  eks_cluster_name = local.eks_cluster_name
  tags             = var.tags
}

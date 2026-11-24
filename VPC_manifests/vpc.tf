module "vpc" {
  source = "./modules/vpc"
  environment_name = var.environment_name
  eks_cluster_name = var.eks_cluster_name
  vpc_cidr         = var.vpc_cidr
  subnet_newbits   = var.subnet_newbits
  tags = var.tags
}
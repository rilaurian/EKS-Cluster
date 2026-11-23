module "vpc" {
  source = "../VPC_manifests"

  environment_name = var.environment_name
  tags             = var.tags
}

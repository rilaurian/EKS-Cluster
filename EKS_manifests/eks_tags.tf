# -------------------------------------------------------------------
# Public Subnet Tags for EKS Load Balancer Support
# -------------------------------------------------------------------

resource "aws_ec2_tag" "eks_subnet_tag_public_elb" {
  for_each    = { for subnet_id in data.terraform_remote_state.vpc.outputs.public_subnet_ids : subnet_id => subnet_id }
  resource_id = each.value
  key         = "kubernetes.io/role/elb"
  value       = "1"
}

resource "aws_ec2_tag" "eks_subnet_tag_public_cluster" {
  for_each    = { for subnet_id in data.terraform_remote_state.vpc.outputs.public_subnet_ids : subnet_id => subnet_id }
  resource_id = each.value
  key         = "kubernetes.io/cluster/${local.eks_cluster_name}"
  value       = "shared"
}

# -------------------------------------------------------------------
# Private Subnet Tags for EKS Internal LoadBalancer Support
# -------------------------------------------------------------------

resource "aws_ec2_tag" "eks_subnet_tag_private_elb" {
  for_each    = { for subnet_id in data.terraform_remote_state.vpc.outputs.private_subnet_ids : subnet_id => subnet_id }
  resource_id = each.value
  key         = "kubernetes.io/role/internal-elb"
  value       = "1"
}

resource "aws_ec2_tag" "eks_subnet_tag_private_cluster" {
  for_each    = { for subnet_id in data.terraform_remote_state.vpc.outputs.private_subnet_ids : subnet_id => subnet_id }
  resource_id = each.value
  key         = "kubernetes.io/cluster/${local.eks_cluster_name}"
  value       = "shared"
}

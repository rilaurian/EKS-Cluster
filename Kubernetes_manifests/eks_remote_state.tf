data "terraform_remote_state" "eks" {
  backend = "local"
  config = {
    path = "../EKS_manifests/terraform.tfstate"
  }
}

provider "kubernetes" {
  host = data.terraform_remote_state.eks.outputs.eks_cluster_endpoint

  cluster_ca_certificate = base64decode(
    data.terraform_remote_state.eks.outputs.eks_cluster_certificate_authority_data
  )

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args = [
      "eks", "get-token",
      "--region", "us-east-1",
      "--cluster-name", data.terraform_remote_state.eks.outputs.eks_cluster_name
    ]
  }
}
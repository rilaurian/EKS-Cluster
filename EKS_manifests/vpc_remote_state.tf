data "terraform_remote_state" "vpc" {
  backend = "local"
  config = {
    path = "../VPC_manifests/terraform.tfstate"
  }
}

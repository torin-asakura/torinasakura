provider "acme" {
  server_url = "https://acme-v02.api.letsencrypt.org/directory"
}

data "terraform_remote_state" "common" {
  backend = "s3"

  config {
    bucket = "torinasakura-dev-devops"
    key    = "common/terraform.tfstate"
    region = "us-east-1"
  }
}

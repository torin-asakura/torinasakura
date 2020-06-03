terraform {
  backend "s3" {
    bucket = "torinasakura-dev-devops"
    key    = "common/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "${var.region}"
}

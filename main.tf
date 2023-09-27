terraform {
  backend "s3" {
    bucket = "khiem-dc11-terraform-s3-state"
    shared_credentials_file = "/home/ubuntu/.aws/credentials"
    key    = "networking.tfstate"
    region = "ap-southeast-2"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  profile                 = terraform.workspace
  shared_credentials_file = "/home/ubuntu/.aws/credentials"
  region                  = terraform.workspace == "default" ? "ap-southeast-2" : terraform.workspace == "test" ? "ap-northeast-3" : "ap-south-1"
}

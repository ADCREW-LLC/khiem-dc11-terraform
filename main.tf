terraform {
  /*backend "s3" {
    access_key = "AKIAWIVUTCVPTL7HHOK3"
    secret_key = "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"
    bucket = "khiem-dc11-terraform-s3-state"
    key    = "networking.tfstate"
    region = "ap-southeast-2"
  }*/

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
  access_key = "AKIAWIVUTCVPTL7HHOK3"
  secret_key = "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"
  region                  = terraform.workspace == "default" ? "ap-southeast-2" : terraform.workspace == "test" ? "ap-northeast-3" : "ap-south-1"
}

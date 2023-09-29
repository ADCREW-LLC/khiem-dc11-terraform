/*terraform {
  backend "s3" {
    access_key = "AKIAWIVUTCVPTL7HHOK3"
    secret_key = "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"
    bucket = "khiem-dc11-terraform-s3-state"
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
  access_key = "AKIAWIVUTCVPTL7HHOK3"
  secret_key = "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"
  region                  = terraform.workspace == "default" ? "ap-southeast-2" : terraform.workspace == "test" ? "ap-northeast-3" : "ap-south-1"
}
*/
terraform {
  # This module is now only being tested with Terraform 0.13.x. However, to make upgrading easier, we are setting
  # 0.12.26 as the minimum version, as that version added support for required_providers with source URLs, making it
  # forwards compatible with 0.13.x code.
  required_version = ">= 0.12.26"
}

# website::tag::1:: The simplest possible Terraform module: it just outputs "Hello, World!"
output "hello_world" {
  value = "Hello, World!"
}

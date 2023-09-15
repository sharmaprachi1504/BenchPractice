# provider "aws" {
 # region = var.AWS_REGION
  # aws = {
  # source  = "hashicorp/aws"
 # version = "~> 2.0"
 # }
# } 
terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

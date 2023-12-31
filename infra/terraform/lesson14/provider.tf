terraform {
  backend "s3" {
    bucket = "levelup-backend-bucket"
    key = "demo/terraform.tfstate"
    region = "eu-central-1"
    dynamodb_table = "levelup-backend-lock"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-central-1"
}
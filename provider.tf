terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-1"
  access_key = "AKIAYDSN7W63BBONGTFD"
  secret_key = "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"
}

provider "aws"  {
  alias  = "usw2"
  region = "us-west-2"
  access_key = "AKIAYDSN7W63BBONGTFD"
  secret_key = "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"
}
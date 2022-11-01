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
  access_key = " "
  secret_key = " "
}

provider "aws"  {
  alias  = "usw2"
  region = "us-west-2"
  access_key = " "
  secret_key = " "
}

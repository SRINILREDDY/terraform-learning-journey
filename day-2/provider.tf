terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.58"
    }
  }
}

provider "aws" {
  region = "ap-south-1"   # or ap-south-2 if you're sure the resources are supported there
}
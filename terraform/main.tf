terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 4.16"
      }
    }
    required_version = ">= 1.2.0"

    backend "s3" {
    bucket = "state-version-tech"
    key = "terraform-eks-state"
    region = "us-east-1"
  }
}

provider "aws" {
    region = "us-east-1"
}

data "aws_subnet" "eks_subnet_1" {
  id = "subnet-0d54589568705e53e"
}

data "aws_subnet" "eks_subnet_2" {
  id = "subnet-0ddcc9607d3c7aec5"
}

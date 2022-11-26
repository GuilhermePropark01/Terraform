terraform {

  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.9.0"
    }
  }

  backend "s3" {
    bucket = "curso-terraform-carlossilva"
    key    = "aws-vm-módulo-local/terraform.tfstate"
    region = "sa-east-1"
  }
}

provider "aws" {
  region = "sa-east-1"

  default_tags {
    tags = {
      owner      = "Carlos Silva"
      managed-by = "Terraform"
    }
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "curso-terraform-carlossilva"
    key    = "aws-vpc/terraform.tfstate"
    region = "sa-east-1"
  }
}

module "network" {
  source = "./Network"

  cidr_vpc    = "10.0.0.0/16"
  cidr_subnet = "10.0.1.0/24"
  environment = "Desenvolvimento"
}

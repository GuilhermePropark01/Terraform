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
    key    = "aws-vpc-provider/terraform.tfstate"
    region = "sa-east-1"
  }
}

provider "aws" {
  region = "sa-east-1"

  default_tags {
    tags = {
      owner      = "Carlos Silva"
      managed-by = "Terraform"
      region     = "sa-east-1"
    }
  }
}

provider "aws" {
  alias  = "Europa"
  region = "eu-central-1"

  default_tags {
    tags = {
      owner      = "Carlos Ribeiro"
      managed-by = "Terraform"
      region     = "eu-central-1"
    }
  }
}

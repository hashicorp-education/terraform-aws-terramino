terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.67.0"
    }

    hcp = {
      source  = "hashicorp/hcp"
      version = "0.96.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

provider "hcp" {
  client_id     = var.client_id
  client_secret = var.client_secret
  project_id    = var.project_id
}
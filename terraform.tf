terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.31.0"
    }
  }
}

provider "aws" {
  region = var.region
}

/*provider "vault" {
  address = "http://13.201.47.72:8200/"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = "fe929cf9-6bab-9330-7a44-f61935069f8e"
      secret_id = "770b464d-149b-48c3-f0b9-2e3f9cf68171"
    }
  }
}*/

/*data "vault_kv_secret_v2" "example" {
  mount = "kv/" // change it according to your mount
  name  = "aws-configure-id" // change it according to your secret
}*/

/*locals {
  vault_data = data.vault_kv_secret_v2.example.data

  aws_access_key_id = local.vault_data["aws_access_key_id"]
  aws_secret_key_id = local.vault_data["aws_secret_key_id"]
}*/

/* variable "aws_access_key_id" {}*/

/* variable "aws_secret_key_id" {} */

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.31.0"
    }
  }
 /* backend "s3" {
      bucket = "my-tf-state-storing-bucket"
      key    = "terraform.tfstate"
      dynamodb_table = "tf-dynamoDB-state-lock"
      region = "us-east-2"
    
  } */
}

provider "aws" {
  region = var.region
 # access_key = data.vault_kv_secret_v2.example.data["aws_access_key_id"]
  #secret_key = data.vault_kv_secret_v2.example.data["aws_secret_key_id"]
}

/*provider "vault" {
  address = "http://13.232.26.81:8210"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = "052f498b-6b1f-8f9c-3887-fd6978d2916d"
      secret_id = "7e046a2a-e6c4-6488-b395-df28c6c0b12b"
    }
  }
}*/

/*data "vault_kv_secret_v2" "example" {
  mount = "kv/" // change it according to your mount
  name  = "aws-configure-id" // change it according to your secret
}*/


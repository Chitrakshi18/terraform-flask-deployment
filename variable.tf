variable "vpc"{
  default = "10.0.0.0/16"
}

variable "subnet"{
  default = "10.0.0.0/24"
}

variable "route"{
  default = "0.0.0.0/0"
}
variable "region" {
  default = "us-east-2"
}
variable "instance_type" {
  default        = "t2.medium"
}

variable "ami" {
  default = "ami-05fb0b8c1424f266b"
}



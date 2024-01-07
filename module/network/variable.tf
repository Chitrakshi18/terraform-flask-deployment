variable "aws_region"{
  description = "Region of VPC"
  type = string
}

variable "vpc_cidr"{
  description = "CIDR of VPC"
  type = string
}

variable "subnet_cidr"{
  description = "CIDR of subnet"
  type = string
}

variable "route_cidr"{
  description = "CIDR of route "
  type = string
}

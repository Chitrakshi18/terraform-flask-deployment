variable "vpc_id"{
  description = "vpc"
  type = string
}

variable "name" {
  description = "name of sg"
  type = string
}

variable "ingress"{
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)    
 }))
}

variable "egress"{
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
 }))
}

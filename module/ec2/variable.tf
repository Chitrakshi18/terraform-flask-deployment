variable "instance_type" {
  description = "Type of EC2 instance (e.g., t2.micro)"
  type        = string
}

variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet where the instance will be launched"
  type        = string
}

variable "security_groups" {
  description = "List of security group IDs for the EC2 instance"
  type        = list
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address with the instance"
  type        = bool
}

/*variable "private_key" {
  description = "Path to the SSH private key file"
  type        = string
}*/

variable "user" {
  description = "SSH user to connect to the instance"
  type        = string
}

variable "key_name"{
  description = "key-name"
  type        = string
}




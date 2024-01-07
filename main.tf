module "vpc_network"{
  source = "./module/network/"
  vpc_cidr = var.vpc
  subnet_cidr = var.subnet
  route_cidr = var.route
  aws_region = var.region
}

module "key_pair"{
  source = "./module/key_pair/"
  key_name = "tf-ec2"
 # public_key = file("~/tf/tf-ec2.pub")
}

module "security_group" {
  source = "./module/sg/"
  name = "web"
  vpc_id = module.vpc_network.vpc_id

  ingress = [ 
    {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    },
    { 
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }]
 
  egress = [{
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }]
}

module "instance"{
  source = "./module/ec2/"
  associate_public_ip_address = true
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = module.vpc_network.subnet_id
  security_groups     = [module.security_group.security_group_id] 
  user        = "ubuntu"  # Replace with the appropriate username for your EC2 instance
 # private_key = file("tf-ec2")  # Replace with the path to your private key
  key_name   = "tf-ec2"
 # availability_zone = "ap-south-1a"
}




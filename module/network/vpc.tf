resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidr
  map_public_ip_on_launch = true

}
# we define output so we can reference thhis module value to another module
# we refrenced these values from metwork module to  instance module
output "vpc_id"{
  value = aws_vpc.main.id
}

output "subnet_id" {
  value = aws_subnet.main.id
}


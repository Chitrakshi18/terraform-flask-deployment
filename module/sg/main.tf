resource "aws_security_group" "webSg" {
  vpc_id = var.vpc_id
  name = var.name
  dynamic ingress {
    for_each = var.ingress
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
   }

  dynamic egress {
    for_each = var.egress
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
  }
}
}

# we define output so we can reference thhis module value to another module
# we refrenced this in instance module 
output "security_group_id" {
  value = aws_security_group.webSg.id
}


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


#static approach to define each ingress instead of using dynamic
/* 
resource "aws_security_group" "example_sg" {
  name        = var.security_group_name
  description = "Security Group created by the security_group module"

  # Statically define each ingress rule
  ingress {
    from_port   = var.ingress_rules[0].from_port
    to_port     = var.ingress_rules[0].to_port
    protocol    = var.ingress_rules[0].protocol
    cidr_blocks = var.ingress_rules[0].cidr_blocks
    description = var.ingress_rules[0].description
  }

  ingress {
    from_port   = var.ingress_rules[1].from_port
    to_port     = var.ingress_rules[1].to_port
    protocol    = var.ingress_rules[1].protocol
    cidr_blocks = var.ingress_rules[1].cidr_blocks
    description = var.ingress_rules[1].description
  } 
*/

#The dynamic block in Terraform is used to generate multiple nested blocks or elements within a resource, module, or variable definition based on a given expression or set of values
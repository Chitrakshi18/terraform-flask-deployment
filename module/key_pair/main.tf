resource "aws_key_pair" "example" {
  key_name   = var.key_name  # Replace with your desired key name
  public_key = file("~/tf/tf-ec2.pub")  # Replace with the path to your public key file
}


resource "aws_instance" "example" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  security_groups        = var.security_groups
  key_name               = var.key_name
 # availability_zone      = "ap-south-1c"
  associate_public_ip_address = var.associate_public_ip_address
  provisioner "file" {
    source      = "/home/ubuntu/tf/module/ec2/app.py"  # Replace with the path to your local file
    destination = "/home/ubuntu/app.py"  # Replace with the path on the remote instance
    connection {
      type        = "ssh"
      user        = var.user
      private_key = file("~/tf/tf-ec2")
      host        = self.public_ip  // Reference to the public IP of the instance
    }
  }
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = var.user
      private_key = file("~/tf/tf-ec2")
      host        = self.public_ip  // Reference to the public IP of the instance
    }

    #Remote-exec provisioner commands to run on the instance
    inline = [
     # "echo 'Hello, World!' > hello.txt",
      "sudo apt update -y && sudo apt install -y python3-pip && sudo pip3 install --ignore-installed blinker && sudo pip3 install flask",
      "python3 app.py"
    ]
  } 
}

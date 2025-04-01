resource "aws_instance" "dev" {
  instance_type = var.instance_type
  key_name      = var.key_name
  ami           = var.ami

  tags = {
    Name = "my-server"
  }

}
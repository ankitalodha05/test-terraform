resource "aws_instance" "dev" {
  instance_type =var.instance_type
  ami = var.ami
  key_name = var.key_name
  
}

# resource "aws_instance" "dev-2" {
#   instance_type =var.instance_type
#   ami = var.ami
#   key_name = var.key_name
  
# }

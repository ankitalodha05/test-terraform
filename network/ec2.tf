resource "aws_instance" "dev-1" {
  ami                         = "ami-08b5b3a93ed654d19"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.dev-pub.id
  key_name                    = "key"
  security_groups             = [aws_security_group.dev-sg.id]
  associate_public_ip_address = true
  tags = {
    Name = "pub-server"
  }
}

resource "aws_instance" "dev-2" {
  ami             = "ami-08b5b3a93ed654d19"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.dev-pvt.id
  key_name        = "key"
  security_groups = [aws_security_group.dev-sg.id]
  tags = {
    Name = "pvt-server"
  }
}
  
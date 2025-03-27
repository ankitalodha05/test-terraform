resource "aws_instance" "name" {
  ami           = "ami-08b5b3a93ed654d19"
  instance_type = "t2.micro"
  subnet_id     = "subnet-0394685e7d1d8f619"
  key_name      = "key"

  associate_public_ip_address = true
  availability_zone           = "us-east-1b"
  monitoring                 = false
  disable_api_termination    = false
  vpc_security_group_ids     = ["sg-019eebdd4c1f2a0b0"]
  source_dest_check          = true

  root_block_device {
    volume_size           = 8
    volume_type           = "gp3"
    delete_on_termination = true
    iops                  = 3000
    throughput            = 125
  }

  tags = {
    Name = "ec2"
  }
}

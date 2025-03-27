resource "aws_vpc" "dev" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "test-vpc"
  }
}

resource "aws_subnet" "dev-pub" {

  vpc_id     = aws_vpc.dev.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "dev-pvt" {

  vpc_id     = aws_vpc.dev.id
  cidr_block = "10.0.2.0/24"
  tags = {
    Name = "private-subnet"
  }
}

resource "aws_internet_gateway" "dev" {
  vpc_id = aws_vpc.dev.id
  tags = {
    Name = "internet-gatway"
  }
}

# Allocate Elastic IP for NAT Gateway
resource "aws_eip" "dev-eip" {
  domain = "vpc"
  tags = {
    Name = "nat-eip"
  }
}


resource "aws_nat_gateway" "dev" {
  subnet_id     = aws_subnet.dev-pub.id
  allocation_id = aws_eip.dev-eip.id
  tags = {
    Name = "Nat-gatway"
  }
}

resource "aws_route_table" "dev-pub" {
  vpc_id = aws_vpc.dev.id
  tags = {
    Name = "RT-public"
  }
  route {
    cidr_block           = "0.0.0.0/0"
    gateway_id= aws_internet_gateway.dev.id
  }
}

resource "aws_route_table" "dev-pvt" {
  vpc_id = aws_vpc.dev.id
  tags = {
    Name = "RT-private"
  }
  route {
    cidr_block      = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.dev.id
  }
}

resource "aws_route_table_association" "pvt" {
  subnet_id      = aws_subnet.dev-pvt.id
  route_table_id = aws_route_table.dev-pvt.id
}

resource "aws_route_table_association" "pub" {
  subnet_id      = aws_subnet.dev-pub.id
  route_table_id = aws_route_table.dev-pub.id
}
resource "aws_security_group" "dev-sg" {
  vpc_id = aws_vpc.dev.id
  tags = {
    Name = "terra-SG"
  }
  egress {
    from_port  = 0
    to_port    = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
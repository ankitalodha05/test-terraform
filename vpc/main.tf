resource "aws_vpc" "dev" {
    cidr_block = "10.0.0.0/16"
    tags = {
        NAME = "test-server"
    }
  
}

resource "aws_subnet" "public-1" {
    vpc_id = aws_vpc.dev.id
    cidr_block = "10.0.1.0/24"
    tags = {
      NAME = "public-subnet-1"
    }
  
}

resource "aws_subnet" "public-2" {
    vpc_id = aws_vpc.dev.id
    cidr_block = "10.0.2.0/24"
    tags = {
      NAME = "public-subnet-2"
    }
  
}

resource "aws_internet_gateway" "dev" {
    vpc_id = aws_vpc.dev.id
    tags = {
      NAME ="test-IG"
    }
  
}

resource "aws_route_table" "dev" {
    vpc_id = aws_vpc.dev.id
    tags = {
      NAME = "public-RT"
    }
    route = {
        cidr_block ="0.0.0.0/24"
        aws_internet_gateway=aws_internet_gateway.dev.id
    }
}

resource "aws_route_table_association" "dev" {
    route_table_id = aws_route_table.dev.id
    subnet_id = aws_subnet.public-1.id
}

resource "aws_route_table_association" "dev-a" {
    route_table_id = aws_route_table_association.dev.id
    subnet_id = aws_subnet.public-2.id
}
resource "aws_security_group" "dev" {
    name = 
  
}
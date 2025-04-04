provider "aws" {
  region = "ap-south-1"
}

data "aws_availability_zones" "available" {}

resource "aws_vpc" "OF-vpc" {
  cidr_block           = "10.10.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "OF-vpc"
  }
}

# Subnet 1 - AZ 1
resource "aws_subnet" "OF-subnet-1" {
  vpc_id            = aws_vpc.OF-vpc.id
  cidr_block        = "10.10.1.0/24"
  availability_zone = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "OF-subnet-1"
  }
}

# Subnet 2 - AZ 2
resource "aws_subnet" "OF-subnet-2" {
  vpc_id            = aws_vpc.OF-vpc.id
  cidr_block        = "10.10.2.0/24"
  availability_zone = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "OF-subnet-2"
  }
}

resource "aws_internet_gateway" "OF-igw" {
  vpc_id = aws_vpc.OF-vpc.id

  tags = {
    Name = "OF-igw"
  }
}

resource "aws_route_table" "OF-rt" {
  vpc_id = aws_vpc.OF-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.OF-igw.id
  }

  tags = {
    Name = "OF-rt"
  }
}

resource "aws_route_table_association" "OF-rt-assoc-1" {
  subnet_id      = aws_subnet.OF-subnet-1.id
  route_table_id = aws_route_table.OF-rt.id
}

resource "aws_route_table_association" "OF-rt-assoc-2" {
  subnet_id      = aws_subnet.OF-subnet-2.id
  route_table_id = aws_route_table.OF-rt.id
}

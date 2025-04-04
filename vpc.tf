# To Create VPC

resource "aws_vpc" "OF-vpc" {
  cidr_block = "10.10.0.0/16"
  tags = {
    Name = "OF-vpc"
  }
}


# To Create Public Subnets 

resource "aws_subnet" "OF-subnets-public" {
  vpc_id     = aws_vpc.OF-vpc.id
  cidr_block = "10.10.1.0/24"

  tags = {
    Name = "OF-subnets-public"
  }
}


# To Create Private Subnets 

resource "aws_subnet" "OF-subnets-private" {
  vpc_id     = aws_vpc.OF-vpc.id
  cidr_block = "10.10.1.0/24"

  tags = {
    Name = "OF-subnets-private"
  }
}


# To Create Internet Gateway

resource "aws_internet_gateway" "OF-igw" {
  vpc_id = aws_vpc.OF-vpc.id

  tags = {
    Name = "OF-igw"
  }
}


# To Create Route Tables

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


# Association of public subnet to route table 

resource "aws_route_table_association" "OF-rta-public" {
  subnet_id      = aws_subnet.OF-subnets-public.id
  route_table_id = aws_route_table.OF-rt.id
}


# Association of private subnet to route table 

resource "aws_route_table_association" "OF-rta-private" {
  subnet_id      = aws_subnet.OF-subnets-private.id
  route_table_id = aws_route_table.OF-rt.id
}


# To Create Security Group

resource "aws_security_group" "OF-sg" {
  name   = "OF-sg"
  vpc_id = aws_vpc.OF-vpc.id
}

resource "aws_vpc_security_group_ingress_rule" "OF-sgi" {
  ip_protocol       = "tcp"
  security_group_id = aws_security_group.OF-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "OF-sge" {
  ip_protocol       = "-1"
  security_group_id = aws_security_group.OF-sg.id
  cidr_ipv4         = "0.0.0.0/0"
}

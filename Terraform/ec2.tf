resource "aws_instance" "OnFinance" {
  ami = "ami-0e35ddab05955cf57"
  key_name = "OF-server"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.OF-subnets.id
  vpc_security_group_ids = [aws_security_group.OF-sg.id]
}
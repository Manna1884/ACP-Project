#Creating 1st EC2
resource "aws_instance" "server1" {
  ami           = "ami-023665fdad063c8a9"
  instance_type = "t2.micro"
  key_name = "Manna"
  vpc_security_group_ids = [aws_security_group.acp_ec2_sec.id]
  associate_public_ip_address = "true"
  subnet_id = aws_subnet.public_subnet1.id

  tags = {
    name = var.instance1_name
  }
}

#Creating 2nd EC2
resource "aws_instance" "server2" {
  ami           = "ami-023665fdad063c8a9"
  instance_type = "t2.micro"
  key_name = "Manna"
  vpc_security_group_ids = [aws_security_group.acp_ec2_sec.id]
  associate_public_ip_address = "true"
  subnet_id = aws_subnet.public_subnet2.id
  
  tags = {
    name = var.instance2_name
  }
}
#Creating RDS Instance
resource "aws_db_subnet_group" "rds" {
  name       = "main"
  subnet_ids = [aws_subnet.private_subnet1.id, aws_subnet.private_subnet2.id]

  tags = {
    Name = var.rds_subnet_name
  }
}

resource "aws_db_instance" "rds_instance" {
  db_subnet_group_name   = aws_db_subnet_group.rds.id
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "shem"
  password             = "cloudrock"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true


tags = {
    Name = var.rds_name
  }
}
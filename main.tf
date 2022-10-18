# Configure the AWS Provider
provider "aws" {
  region = "eu-west-2"

}

# Create a VPC
resource "aws_vpc" "vpc-project" {
  cidr_block = var.cidr_block_vpc
  instance_tenancy = "default"
  enable_dns_hostnames = "true"
  enable_dns_support = "true"

  tags = {
    Name = var.vpc_name
  }

}

#Creating Public Subnet 1
resource "aws_subnet" "public_subnet1" {
  vpc_id     = aws_vpc.vpc-project.id
  cidr_block = var.cidr_block_publicsub1
  availability_zone = "eu-west-2a"

  tags = {
    Name = var.name_publicsub1
  }
}

#Creating Public Subnet 2
resource "aws_subnet" "public_subnet2" {
  vpc_id     = aws_vpc.vpc-project.id
  cidr_block = var.cidr_block_publicsub2
  availability_zone = "eu-west-2b"

  tags = {
    Name = var.name_publicsub2
  }
}

#Creating Private Subnet 1
resource "aws_subnet" "private_subnet1" {
  vpc_id     = aws_vpc.vpc-project.id
  cidr_block = var.cidr_block_privatesub1
  availability_zone = "eu-west-2a"

  tags = {
    Name = var.name_privatesub1
  }
}

#Creating Private Subnet 2
resource "aws_subnet" "private_subnet2" {
  vpc_id     = aws_vpc.vpc-project.id
  cidr_block = var.cidr_block_privatesub2
  availability_zone = "eu-west-2b"

  tags = {
    Name = var.name_privatesub2
  }
}

#Creating Public Route table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc-project.id

  tags = {
    Name = var.route_table_public
  }
}

#Creating Private Route table
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc-project.id

  tags = {
    Name = var.route_table_private
  }
}

#Route Association Public1
resource "aws_route_table_association" "public-route-table-association1" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.public_route_table.id
}

#Route Association Public2
resource "aws_route_table_association" "public-route-table-association2" {
  subnet_id      = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.public_route_table.id
}

#Route Association Private1
resource "aws_route_table_association" "private-route-table-association1" {
  subnet_id      = aws_subnet.private_subnet1.id
  route_table_id = aws_route_table.private_route_table.id
}

#Route Association Private2
resource "aws_route_table_association" "private-route-table-association2" {
  subnet_id      = aws_subnet.private_subnet2.id
  route_table_id = aws_route_table.private_route_table.id
}

#Creating Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc-project.id

  tags = {
    Name = var.internet_gateway_name
  }
}

#Internet Gateway Route
resource "aws_route" "igw-route" {
  route_table_id            = aws_route_table.public_route_table.id
  gateway_id                = aws_internet_gateway.igw.id
  destination_cidr_block    = "0.0.0.0/0"

}

#Create Elastic IP
resource "aws_eip" "acp_eip" {
  vpc                       = true
  associate_with_private_ip = "150.0.64.1"


tags = {
    Name = var.eip_name
  }
}

#Create NAT Gateway for Internet Thru Public Subnet
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.acp_eip.id
  subnet_id     = aws_subnet.public_subnet1.id

  tags = {
    Name = var.nat_gw_name
  }
}

# Route NAT GW with Private Route Table
resource "aws_route" "nat_gw_association_private_rt" {
  route_table_id         = aws_route_table.private_route_table.id
  nat_gateway_id         = aws_nat_gateway.nat_gw.id
  destination_cidr_block = "0.0.0.0/0"
}  


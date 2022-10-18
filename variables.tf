
variable cidr_block_vpc {
    description = "making the cidr block of the vpc a variable"
    default = "150.0.0.0/16"
    type = string

}

variable vpc_name {
    description = "making the name of vpc a variable"
    default = "acp-project"
    type = string
    
}

variable cidr_block_publicsub1{
    description = "making the cidr block for public subnet1 a variable"
    default = "150.0.0.0/19"
    type = string

}

variable name_publicsub1 {
    description = "making the name of public subnet 1 a variable"
    default = "acp-publicsub1"
    type = string
    
}

variable cidr_block_publicsub2{
    description = "making the cidr block for public subnet2 a variable"
    default = "150.0.32.0/19"
    type = string

}

variable name_publicsub2 {
    description = "making the name of public subnet2 a variable"
    default = "acp-publicsub2"
    type = string
    
}

variable cidr_block_privatesub1{
    description = "making the cidr block for private subnet1 a variable"
    default = "150.0.64.0/18"
    type = string

}

variable name_privatesub1 {
    description = "making the name of private subnet1 a variable"
    default = "acp-privatesub1"
    type = string
    
}

variable cidr_block_privatesub2{
    description = "making the cidr block for private subnet2 a variable"
    default = "150.0.128.0/17"
    type = string

}

variable name_privatesub2 {
    description = "making the name of private subnet2 a variable"
    default = "acp-privatesub2"
    type = string
    
}

variable route_table_public {
    description = "making the name of public route table a variable"
    default = "acp-public-route"
    type = string
    
}

variable route_table_private {
    description = "making the name of private route table a variable"
    default = "acp-private-route"
    type = string
    
}

variable internet_gateway_name {
    description = "making the name of internet gateway a variable"
    default = "acp-igw"
    type = string
    
}

variable eip_name {
    description = "making the name of elastic IP a variable"
    default = "acp-eip"
    type = string
    
}

variable nat_gw_name {
    description = "making the name of NAT Gatewat a variable"
    default = "acp-nat-gw"
    type = string
    
}

variable sec_group {
    description = "making the name of security group for instances a variable"
    default = "acp-sec-grp"
    type = string
    
}

variable instance1_name {
    description = "making the name of instance1 a variable"
    default = "acp-server1"
    type = string
    
}

variable instance2_name {
    description = "making the name of instance2 a variable"
    default = "acp-server2"
    type = string
    
}

variable alb_tg_name {
    description = "making the name of alb target group a variable"
    default = "acp-alb-tg"
    type = string
    
}

variable alb_name {
    description = "making the name of alb a variable"
    default = "acp-alb"
    type = string
    
}

variable alb_sec_group {
    description = "making the name of alb security group a variable"
    default = "acp-alb-sec-group"
    type = string
    
}

variable rds_name {
    description = "making the name of rds a variable"
    default = "acp-rds"
    type = string
    
}

variable rds_subnet_name {
    description = "making the name of rds a variable"
    default = "acp_rdsubnet_group"
    type = string
    
}
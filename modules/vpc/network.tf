resource "aws_vpc" "vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = var.tenancy

  tags = {
    Name = "vpc"
  }
}

resource "aws_subnet" "subnet" {
  vpc_id     = var.vpc_id
  cidr_block = var.subnet_cidr

  tags = {
    Name = "subnet"
  }
}


output "vpc_id" {
    value = aws_vpc.vpc.id
  
}
output "subnet_id" {
    value = aws_subnet.subnet.id
  
}

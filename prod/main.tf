
provider "aws" {
    region = "us-east-1"
    access_key = "AKIA2FWCYI5DWGWCFBXE"
    secret_key = "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"
  
}



module "prod_vpc" {
    source = "../modules/vpc"

    vpc_cidr = "10.0.0.0/16"
    tenancy = "default"
    vpc_id = module.prod_vpc.vpc_id
    subnet_cidr = "10.0.1.0/24"
  
}


module "prod_ec2" {
    source = "../modules/ec2"
    ami_id = "ami-052efd3df9dad4825"
    instance_type = "t2.micro"
    subnet_id = module.prod_vpc.subnet_id
    ec2_count = "1"
  
}

provider "aws" {
    region = "us-west-2"
    access_key = "AKIA2FWCYI5DWGWCFBXE"
    secret_key = "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"
  
}



module "dev_vpc" {
    source = "../modules/vpc"

    vpc_cidr = "10.0.0.0/16"
    tenancy = "default"
    vpc_id = module.dev_vpc.vpc_id
    subnet_cidr = "10.0.1.0/24"
  
}


module "dev_ec2" {
    source = "../modules/ec2"
    ami_id = "ami-0d70546e43a941d70"
    instance_type = "t2.micro"
    subnet_id = module.dev_vpc.subnet_id
    ec2_count = "1"
  
}
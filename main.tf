provider "aws" {
  region = "ap-southeast-2" #sydney
}

module "vpc" {
  source             = "./modules/vpc"
  vpc_cidr           = "10.0.0.0/16"
  public_subnet_cidr = "10.0.1.0/24"
  db_subnet_cidr     = "10.0.2.0/24"
}

module "ec2" {
  source        = "./modules/ec2"
  ami           = "ami-0e326862c8e74c0fe" # Example AMI
  instance_type = "t2.micro"
  vpc_id        = module.vpc.vpc_id
  subnet_id     = module.vpc.subnet_id
}
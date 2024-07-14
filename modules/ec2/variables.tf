variable "ami" {
  description = "AMI to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where the instance will be deployed"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the security group will be created"
  type        = string
}
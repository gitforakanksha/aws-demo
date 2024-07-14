variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "db_subnet_cidr" {
  description = "CIDR block for the DB subnet"
  type        = string
}
variable "public_subnet_az1_id" {}
variable "internet_gateway" {}
variable "public_subnet_az2_id" {}
variable "vpc_id" {}
variable "private_app_subnet_az1_id" {}
variable "private_app_subnet_az2_id" {}

variable "aws_eip_az1_name" {
  type    = string
  default = "nat gateway az1 eip"
}

variable "aws_eip_az2_name" {
  type    = string
  default = "nat gateway az2 eip"
}

variable "nat_gateway_az1_name" {
  type    = string
  default = "nat gateway az1"
}

variable "nat_gateway_az2_name" {
  type    = string
  default = "nat gateway az2"
}

variable "private_route_table_az1_name" {
  type    = string
  default = "private route table az1"
}

variable "private_route_table_az2_name" {
  type    = string
  default = "private route table az2"
}

variable "cidr" {
  description = "The CIDR block for the VPC"
  default     = "0.0.0.0/0"
}

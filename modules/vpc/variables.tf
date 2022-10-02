variable "region" {}
variable "project_name" {}
variable "vpc_cidr" {}
variable "public_subnet_az1_cidr" {}
variable "public_subnet_az2_cidr" {}
variable "private_app_subnet_az1_cidr" {}
variable "private_app_subnet_az2_cidr" {}

variable "public_subnet_az1_name" {
  type    = string
  default = "public subnet az1"
}

variable "public_subnet_az2_name" {
  type    = string
  default = "public subnet az2"
}

variable "public_route_table_name" {
  type    = string
  default = "public route table"
}

variable "private_app_subnet_az1_name" {
  type    = string
  default = "private app subnet az1"
}

variable "private_app_subnet_az2_name" {
  type    = string
  default = "private app subnet az2"
}

variable "cidr" {
  description = "The CIDR block for the VPC"
  default     = "0.0.0.0/0"
}

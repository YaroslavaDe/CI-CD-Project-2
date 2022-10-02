variable "ec2_key_pair" {
  description = "AWS ec2 key pair"
  type        = string
  default     = "ssh_project"
}

variable "ec2_instance_type" {
  description = "AWS EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "security_group_name" {
  description = "Security group tags"
  type        = string
  default     = "ec2 security group"
}

variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "ec2 in private subnet az1"
}

variable "instance_name_second" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "ec2 in private subnet az2"
}

variable "private_app_subnet_az1_id" {}

variable "private_app_subnet_az2_id" {}

variable "vpc_id" {}

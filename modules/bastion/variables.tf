variable "vpc_id" {}
variable "public_subnet_az1_id" {}
variable "public_subnet_az2_id" {}
variable "ec2_key_pair" {
  description = "AWS ec2 key pair"
  type        = string
  default     = "ssh_project"
}
variable "instance_type" {
  description = "AWS bastion instance type"
  type        = string
  default     = "t2.micro"
}
variable "security_group_name" {
  description = "Security group tags"
  type        = string
  default     = "Bastion security group"
}
variable "aws_autoscaling_group_name" {
  type        = string
  default     = "BastionHOST-ASG"
}
variable "image_id" {
  type        = string
  default     = "ami-0be590cb7a2969726"
}
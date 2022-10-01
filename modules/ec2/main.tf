# create security group for the ec2 instance
resource "aws_security_group" "ec2_security_group" {
  name        = "ec2 security group"
  description = "allow SSH access on 22"
  vpc_id      = var.vpc_id

  ingress {
    description      = "ssh access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = -1
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags   = {
    Name = var.security_group_name
  }
}

# use data source to get a registered amazon linux 2 ami
data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]
  
  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}


# launch the ec2 instance in private subnet az1
resource "aws_instance" "ec2_instance_az1" {
  ami                    = data.aws_ami.amazon_linux_2.id
  instance_type          = var.ec2_instance_type
  subnet_id              = var.private_app_subnet_az1_id 
  vpc_security_group_ids = [aws_security_group.ec2_security_group.id]
  key_name               = var.ec2_key_pair

  tags = {
    Name = var.instance_name
  }
}

# launch the ec2 instance in private subnet az2
resource "aws_instance" "ec2_instance_az2" {
  ami                    = data.aws_ami.amazon_linux_2.id
  instance_type          = var.ec2_instance_type
  subnet_id              = var.private_app_subnet_az2_id 
  vpc_security_group_ids = [aws_security_group.ec2_security_group.id]
  key_name               = var.ec2_key_pair

  tags = {
    Name = var.instance_name
  }
}
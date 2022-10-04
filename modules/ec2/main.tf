# create security group for the ec2 instance
resource "aws_security_group" "ec2_security_group" {
  name        = var.security_group_name
  description = "allow SSH access on port 22"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = ["80", "22"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
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

  user_data = <<EOF
#!/bin/bash
yum update -y
yum install httpd -y
systemctl start httpd
service systemctl enable httpd
echo "<html><body bgcolor=black><center><h1><p><font color=gold>Web Server 1</h1></center></body></html>" > /var/www/html/index.html
EOF

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

  user_data = <<EOF
#!/bin/bash
yum update -y
yum install httpd -y
systemctl start httpd
service systemctl enable httpd
echo "<html><body bgcolor=grey><center><h1><p><font color=red>Web Server 2</h1></center></body></html>" > /var/www/html/index.html
EOF

  tags = {
    Name = var.instance_name_second
  }
}

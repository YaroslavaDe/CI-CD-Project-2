output "instance_alb" {
  value = aws_instance.ec2_instance_az1.id
}

output "instance_alb_second" {
  value = aws_instance.ec2_instance_az2.id
}
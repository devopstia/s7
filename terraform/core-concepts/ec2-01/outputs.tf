# Output the security group ID
output "security_group_id" {
  description = "The ID of the security group allowing SSH."
  value       = aws_security_group.allow_ssh.id
}

# Output the instance ID
output "instance_id" {
  description = "The ID of the EC2 instance."
  value       = aws_instance.my_ec2.id
}

# # Create an EC2 instance
# resource "aws_instance" "my_ec2" {
#   depends_on = [
#     aws_security_group.allow_ssh
#   ]
# #   ami           = "ami-0e86e20dae9224db8"  # Replace with anropriate AMI ID for your region
#   ami = data.aws_ami.ubuntu.id
#   instance_type = "t2.micro"

#   # Associate the key pair and security group
#   key_name               = "s7-key"
#   vpc_security_group_ids = [aws_security_group.allow_ssh.id]

#   # Increase the root volume to 30 GB
#   root_block_device {
#     volume_size = 30       # Set the root volume size to 30 GB
#     volume_type = "gp3"    # General Purpose SSD (GP2), you can also use "gp3" or other volume types
#   }

#   tags = {
#     Name = "s7-ec2"
#     Create_By   = "Terraform"
#     Environment = "Development"
#     Project     = "Alpha"
#     Company     = "DEL"
#   }
# }
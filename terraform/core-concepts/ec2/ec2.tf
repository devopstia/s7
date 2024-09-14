# Create an EC2 instance
resource "aws_instance" "my_ec2" {
#   ami           = "ami-0e86e20dae9224db8"  # Replace with an appropriate AMI ID for your region
  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  # Associate the key pair and security group
  key_name               = "s7-key"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name = "s7-ec2"
    Create_By   = "Terraform"
    Environment = "Development"
    Project     = "Alpha"
    Company     = "DEL"
  }
}
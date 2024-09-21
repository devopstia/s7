
# Create an EC2 instance
resource "aws_instance" "my_ec2" {
  depends_on = [
    aws_security_group.allow_ssh
  ]
#   ami           = "ami-0e86e20dae9224db8"  # Replace with an appropriate AMI ID for your region
  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  # Associate the key pair and security group
  key_name               = "s7-key"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  # Increase the root volume to 30 GB
  root_block_device {
    volume_size = 30       # Set the root volume size to 30 GB
    volume_type = "gp3"    # General Purpose SSD (GP2), you can also use "gp3" or other volume types
  }

  # User data script to install Apache2
  user_data = <<EOF
    #!/bin/bash
    sudo apt update
    sudo apt install -y apache2
    sudo systemctl start apache2
    sudo systemctl enable apache2

    sudo apt install -y wget
    sudo apt install -y unzip
    cd /var/www/html/
    sudo rm -rf *
    sudo wget https://warfiles-for-docker.s3.amazonaws.com/app/creative.zip
    sudo unzip creative.zip
    sudo cp -r creative/* .
    sudo rm -rf creative
    sudo rm -rf creative.zip
  EOF

  tags = {
    Name = "s7-ec2"
    Create_By   = "Terraform"
    Environment = "Development"
    Project     = "Alpha"
    Company     = "DEL"
  }
}
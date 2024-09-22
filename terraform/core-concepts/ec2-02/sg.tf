resource "aws_security_group" "allow_ssh" {
  name        = "allow ports 22, 80 and 8080"
  description = "Allow SSH inbound traffic"
  vpc_id      = "vpc-068852590ea4b093b"
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Create_By   = "Terraform"
    Environment = "Development"
    Project     = "Alpha"
    Company     = "DEL"
  }
}
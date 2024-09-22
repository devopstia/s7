resource "aws_instance" "my_ec2" {
  depends_on = [
    aws_security_group.allow_ssh
  ]
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  root_block_device {
    volume_size = var.volume_size      
    volume_type = "gp3"   
  }

  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y apache2
              
              cat <<EOL > /var/www/html/index.html
              <!DOCTYPE html>
              <html>
              <body>
              <h1>Welcome to DevOps Easy Learning</h1>
              </body>
              </html>
              EOL
              
              systemctl enable apache2
              systemctl start apache2
              EOF


  tags = {
    Name = var.instance_name
    Create_By   = "Terraform"
    Environment = var.environment
    Project     = "Alpha"
    Company     = "DEL"
  }
}
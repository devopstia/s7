resource "aws_eip" "my_eip" {
  depends_on = [
    aws_instance.my_ec2
  ]
  instance = aws_instance.my_ec2.id
  vpc      = true
  
  tags = {
    Name        = "s7-ec2-eip"
    Environment = "Development"
    Project     = "Alpha"
    Company     = "DEL"
  }
}

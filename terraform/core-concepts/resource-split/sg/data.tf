data "aws_vpc" "my_vpc_data" {
  filter {
    name   = "tag:Name"
    values = ["MyVPC"]
  }
}


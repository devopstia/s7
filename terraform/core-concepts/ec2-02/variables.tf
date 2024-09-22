variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "key_name" {
  type = string
}

variable "volume_size" {
  type    = number
  default = 10
}

variable "instance_name" {
  type = string
}

variable "environment" {
  type = string
}
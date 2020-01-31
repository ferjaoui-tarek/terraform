variable "region" {
  default = "eu-west-3"
}

variable "ami-id" {
  default = "ami-007fae589fdf6e955"
}

variable "ec2-size" {
  default = "t2.micro"
}

variable "amis" {
  type = map(string)
  default = {
    "us-east-1" = "ami-b374d5a5"
    "us-west-2" = "ami-4b32be2b"
    "eu-west-3" = "ami-007fae589fdf6e955"
  }
}
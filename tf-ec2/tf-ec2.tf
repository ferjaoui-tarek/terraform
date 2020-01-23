provider "aws" {
  profile = "default"
  region  = "eu-west-3"
}

resource "aws_instance" "example" {
  ami           = "ami-0581b2fffa0f0453b"
  instance_type = "t2.micro"
}

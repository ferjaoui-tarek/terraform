variable "region" {
  default = "eu-west-3"
}
provider "aws" {
  profile = "default"
  region  = var.region
}

#resource "aws_eip" "ip" {
#  vpc      = true
#  instance = aws_instance.myFirstTerraform.id
#}

resource "aws_instance" "myFirstTerraform" {
  ami           = "ami-007fae589fdf6e955"
  instance_type = "t2.micro"
  tags = {
    Name = "MyFirstTerraformInstance"
  }

  depends_on = [aws_s3_bucket.myFirstTerraform]
}

resource "aws_s3_bucket" "myFirstTerraform" {
  # NOTE: S3 bucket names must be unique across _all_ AWS accounts, so
  # this name must be changed before applying this example to avoid naming
  # conflicts.
  bucket = "my-first-terraform-bucket-trx"
  acl    = "private"
}
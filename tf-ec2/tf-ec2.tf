
provider "aws" {
  profile = "default"
  region  = var.region
}

#resource "aws_eip" "ip" {
#  vpc      = true
#  instance = aws_instance.myFirstTerraform.id
#}

resource "aws_instance" "myFirstTerraform" {
  ami           = var.amis[var.region]
  instance_type = var.ec2-size
  tags = {
    Name = "MyFirstTerraformInstance"
  }
  #Our S3 bucket
  depends_on = [aws_s3_bucket.myFirstTerraform]
  #Our user data
  user_data = file("./userdata.sh")
  # Our Security group to allow HTTP and SSH access
  vpc_security_group_ids = [aws_security_group.myFirstTerraformSG.id]

  #Subnet environment it's more common to have a separate private subnet for backend instances.
  subnet_id = aws_subnet.myFirstTerraformSubnet.id

}

resource "aws_s3_bucket" "myFirstTerraform" {
  # NOTE: S3 bucket names must be unique across _all_ AWS accounts, so
  # this name must be changed before applying this example to avoid naming
  # conflicts.
  bucket = "my-first-terraform-bucket-trx"
  acl    = "private"
}
# Our default security group to access
# the instances over SSH and HTTP
resource "aws_security_group" "myFirstTerraformSG" {
  name        = "myFirstTerraformSG"
  description = "Used in the first terraform"
  vpc_id      = aws_vpc.myFirstTerraformVPC.id

  # SSH access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP access from the VPC
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
#    cidr_blocks = ["10.0.0.0/16"]
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "myFirstTerraformSG"
  }
}
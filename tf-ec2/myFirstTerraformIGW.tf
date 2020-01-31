# Create an internet gateway to give our subnet access to the outside world
resource "aws_internet_gateway" "myFirstTerraformIGW" {
  vpc_id = aws_vpc.myFirstTerraformVPC.id
  tags = {
    Name = "myFirstTerraformIGW"
  }
}
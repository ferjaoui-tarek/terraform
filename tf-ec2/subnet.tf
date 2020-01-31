# Create a subnet to launch our instances into
resource "aws_subnet" "myFirstTerraformSubnet" {
  vpc_id                  = aws_vpc.myFirstTerraformVPC.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "myFirstTerraformSubnet"
  }
}
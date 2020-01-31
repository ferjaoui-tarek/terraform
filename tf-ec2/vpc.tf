# Create a VPC to launch our instances into
resource "aws_vpc" "myFirstTerraformVPC" {
  cidr_block = "10.0.0.0/16"
}
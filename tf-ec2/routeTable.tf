# Grant the VPC internet access on its main route table
resource "aws_route" "internet_access" {
  route_table_id         = aws_vpc.myFirstTerraformVPC.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.myFirstTerraformIGW.id
  tags = {
    Name = "internet_access"
  }
}

# Private route table for the capstone VPC.
# AWS automatically provides the local VPC route.

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.capstone.id

  tags = {
    Name = "${var.project_name}-private-rt"
  }
}

# Connect the private subnet to the private route table.

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}

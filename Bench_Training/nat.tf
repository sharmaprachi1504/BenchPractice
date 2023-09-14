
### Create Elastic IP

resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.main-public.id
  depends_on    = [aws_internet_gateway.main-igw]
}
#tags {
#   Name = "nat-gw"
# }

# VPC setup for NAT

resource "aws_route_table" "Private-RT" {
  vpc_id = aws_vpc.main-vpc.id
  tags = {
    Name = "Private-RT"
  }
}

#Route table Association with Private Subnet

resource "aws_route_table_association" "Private-RT-ass" {
  subnet_id      = aws_subnet.main-private.id
  route_table_id = aws_route_table.Private-RT.id
}

resource "aws_route" "private-nat-route" {
  route_table_id         = aws_route_table.Private-RT.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat-gw.id
}










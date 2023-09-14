# Internet GW
resource "aws_internet_gateway" "main-igw" {
  vpc_id = aws_vpc.main-vpc.id

  tags = {
    Name = "main-igw"
  }
}

#Route table for Public Subnet

resource "aws_route_table" "Public-RT" {
  vpc_id = aws_vpc.main-vpc.id
  tags = {
    Name = "Public-RT"
  }
}

#Route table Association with Public Subnet

resource "aws_route_table_association" "Public-RT-ass" {
  subnet_id      = aws_subnet.main-public.id
  route_table_id = aws_route_table.Public-RT.id
}

resource "aws_route" "public-igw-route" {
  route_table_id         = aws_route_table.Public-RT.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main-igw.id
}


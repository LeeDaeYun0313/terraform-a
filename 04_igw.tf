resource "aws_internet_gateway" "name" {
  vpc_id = aws_vpc.ldy_vpc.id

  tags = {
      Name = "ldy-igw"
  }
}
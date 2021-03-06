resource "aws_eip" "lb_ip_a" {
 # instance = aws_instance.web.id
  vpc      = true
}
resource "aws_eip" "lb_ip_c" {
 # instance = aws_instance.web.id
  vpc      = true
}

resource "aws_nat_gateway" "ldy_natgate_a" {
  allocation_id = aws_eip.lb_ip_a.id
  subnet_id = aws_subnet.ldy_puba.id
  tags = {
    Name = "ldy-natgate-a"
  }
}

resource "aws_nat_gateway" "ldy_natgate_c" {
  allocation_id = aws_eip.lb_ip_c.id
  subnet_id = aws_subnet.ldy_pubc.id
  tags = {
    Name = "ldy-natgate-c"
  }
}
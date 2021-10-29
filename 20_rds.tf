resource "aws_db_instance" "ldy_db" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  identifier           = "ldy-db"
  username             = "root"
  password             = "It12345!"
  parameter_group_name = "default.mysql5.7"
  availability_zone    = "ap-northeast-2a"
  db_subnet_group_name = aws_db_subnet_group.ldy_db_group.id
  skip_final_snapshot  = true
  tags  = {
      name = "mydb"
  }
}

resource "aws_db_subnet_group" "ldy_db_group" {

  name = "dbgroup"
  subnet_ids = [aws_subnet.ldy_pria.id,aws_subnet.ldy_pric.id]
  tags  ={
      Name = "dbgroup"
  }
}
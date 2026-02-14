resource "aws_db_subnet_group" "this" {
  name       = "mysql-subnet-group"
  subnet_ids = var.private_db_subnets

  tags = {
    Name = "mysql-subnet-group"
  }
}

resource "aws_db_instance" "this" {
  identifier              = "eks-mysql-db"
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t3.micro"   # Free tier eligible
  allocated_storage       = 20
  storage_type            = "gp3"
  storage_encrypted       = true

  db_name                 = var.db_name
  username                = var.db_username
  password                = var.db_password

  db_subnet_group_name    = aws_db_subnet_group.this.name
  vpc_security_group_ids  = [var.rds_sg_id]

  publicly_accessible     = false
  multi_az                = false  # Free tier limitation
  skip_final_snapshot     = true

  backup_retention_period = 0

  deletion_protection     = false

  tags = {
    Name = "eks-mysql-db"
  }
}

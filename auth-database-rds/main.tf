#main.tf
#defining the provider as aws
provider "aws" {
    region     = "${var.region}"
    proflie    = "${var.profile}"
}

resource "aws_db_instance" "aurora" {
  allocated_storage    = 20
  engine               = "aurora-mysql"
  engine_version       = "5.7.mysql_aurora.2.08.0"
  instance_class       = "db.t3.small"
  name                 = "my-identity-server-db"
  username             = "admin"
  password             = "mystrongpassword"
  publicly_accessible = false
  skip_final_snapshot = true
  vpc_security_group_ids = [aws_security_group.aurora.id]
}

resource "aws_security_group" "aurora" {
  name        = "aurora-sg"
  description = "Security group for Aurora"
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
#main.tf
#defining the provider as aws
provider "aws" {
    region     = "${var.region}"
    profile = "${var.profile}"
}

resource "aws_db_subnet_group" "player-auth-db-subnet" {
  name       = "player-auth-db-subnet"
  subnet_ids = ["subnet-02ae4f4268107c2b1", "subnet-012a534213cc034ec"]
  
  tags = {
    team = "Platform"
    Name = "Platform-player-auth"
  }
}

resource "aws_db_instance" "player-auth-db" {
  db_name = "playerauthdb"
  identifier = "authdb"
  allocated_storage = 20
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "foo"
  password             = "password100"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name = "player-auth-db-subnet"
}
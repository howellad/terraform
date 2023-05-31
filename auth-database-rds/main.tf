#main.tf
#defining the provider as aws
provider "aws" {
    region     = "${var.region}"
    proflie    = "${var.profile}"
}

resource "aws_db_subnet_group" "player-auth-db-subnet" {
  name       = "player-auth-db-subnet"
  subnet_ids = ["subnet-0379cfc4648718bc3", "subnet-02ae4f4268107c2b1", "subnet-012a534213cc034ec"]
  
  tags = {
    team = "Platform"
    Project = "Player-Authentication"
  }
}

resource "aws_db_instance" "default" {
  db_name = "playerauthdb"
  identifier = "platform-player-auth-rds"
  publicly_accessible = true
  allocated_storage = 20
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "root"
  password             = "password"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name = "platform-player-auth"
  tags = {
    team = "Platform"
    Project = "Player-Authentication"
  }
}
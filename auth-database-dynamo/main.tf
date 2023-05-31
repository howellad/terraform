#main.tf
#defining the provider as aws
provider "aws" {
    region     = "${var.region}"
    profile = "${var.profile}"
}

resource "aws_dynamodb_table" "User-Store-table" {
  name = "Player-Auth-User-Store"
  billing_mode = "PROVISIONED"
  read_capacity= "10"
  write_capacity= "10"
  attribute {
    name = "UserId"
    type = "S"
  }
  hash_key = "UserId"
  tags = {
    team = "Platform"
    Project = "Player-Authentication"
  }
}

resource "aws_dynamodb_table" "AccessToken-Store-table" {
  name = "Player-Auth-AccessToken-Store"
  billing_mode = "PROVISIONED"
  read_capacity= "10"
  write_capacity= "10"
  attribute {
    name = "AccessTokenId"
    type = "S"
  }
  hash_key = "AccessTokenId"
  tags = {
    team = "Platform"
    Project = "Player-Authentication"
  }
}


resource "aws_dynamodb_table" "Persistant-Grant-store-table" {
  name = "Player-Auth-Persistant-Grant-Store"
  billing_mode = "PROVISIONED"
  read_capacity= "20"
  write_capacity= "20"
  attribute {
    name = "GrantId"
    type = "S"
  }
  hash_key = "GrantId"
  tags = {
    team = "Platform"
    Project = "Player-Authentication"
  }
}
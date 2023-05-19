#main.tf
#defining the provider as aws
provider "aws" {
    region     = "${var.region}"
    profile = "${var.profile}"
}

resource "aws_dynamodb_table" "Client-Store-table" {
  name = "Player-Auth-Client-Store"
  billing_mode = "PROVISIONED"
  read_capacity= "20"
  write_capacity= "20"
  attribute {
    name = "ClientId"
    type = "S"
  }
  hash_key = "ClientId"
}

resource "aws_dynamodb_table" "Persistant-Grant-store-table" {
  name = "Player-Auth-Persistant-Grant-Store"
  billing_mode = "PROVISIONED"
  read_capacity= "20"
  write_capacity= "20"
  attribute {
    name = "TokenId"
    type = "S"
  }
  hash_key = "TokenId"
}
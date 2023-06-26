#main.tf
#defining the provider as aws
provider "aws" {
    region     = "${var.region}"
    profile = "${var.profile}"
}

resource "aws_dynamodb_table" "user_table" {
  name           = "IdentityServerUsers"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "UserId"

  attribute {
    name = "UserId"
    type = "S"
  }
}

resource "aws_dynamodb_table" "authorization_code_table" {
  name           = "IdentityServerAuthorizationCodes"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "AuthorizationCode"
  attribute {
    name = "AuthorizationCode"
    type = "S"
  }
}

resource "aws_dynamodb_table" "refresh_token_table" {
  name           = "IdentityServerRefreshTokens"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "RefreshToken"

  attribute {
    name = "RefreshToken"
    type = "S"
  }
}

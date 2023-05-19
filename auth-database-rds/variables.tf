#variables.tf
variable "profile" {
    description = "Secret key to AWS console"
}
variable "region" {
    description = "AWS region"
}

variable "subnet_ids" {
  description = "A list of VPC subnet IDs"
  type        = list(string)
  default     = []
}

variable "name" {
  description = "The name of the DB subnet group"
  type        = string
  default     = ""
}
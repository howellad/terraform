#variables.tf
variable "profile" {
    description = "Secret key to AWS console"
}
variable "region" {
    description = "AWS region"
}

variable "table_read_capacity" {
  description = "Read capacity for access token table."
  type        = number
  default     = 5
}

variable "table_write_capacity" {
  description = "Write capacity for access token table."
  type        = number
  default     = 2
}

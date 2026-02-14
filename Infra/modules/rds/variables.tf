variable "db_name" {
  type = string
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type      = string
  sensitive = true
}

variable "private_db_subnets" {
  type = list(string)
}

variable "rds_sg_id" {
  type = string
}

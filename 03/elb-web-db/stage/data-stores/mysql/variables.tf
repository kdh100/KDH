variable "db_name" {
  description = "The name to use for the database"
  type        = string
  default     = "example_database_stage"
}

# default value is not defined. replace to env TF_VAR_db_username
variable "db_username" {
  description = "The username for the database"
  type        = string
  sensitive   = true
}

# default value is not defined. replace to env TF_VAR_db_password
variable "db_password" {
  description = "The password for the database"
  type        = string
  sensitive   = true
}
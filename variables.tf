variable "services" {
  type = list(string)
}

variable "project_id" {
  type        = string
  description = "The project ID for the GCP"
  default     = "ric-pod-automation"
}

variable "network_name" {
  default = "mysql-private"
  type    = string
}

variable "db_name" {
  description = "The name of the SQL Database instance"
  default     = "mysql-private"
}

variable "cloudsql_mysql_sa" {
  type        = string
  description = "IAM service account user created for Cloud SQL."
  default     = null
}

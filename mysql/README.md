project_id                  = "ric-pod-automation"
name                        = "mysql57"
region                      = "asia-south1"
zone                        = "asia-south1-a"
tier                        = "db-g1-small"
edition                     = "ENTERPRISE"
database_version            = "MYSQL_5_7"
deletion_protection_enabled = "false"
deletion_protection         = "false"
availability_type           = "REGIONAL"
root_password               = "NetEnrich@123#"
user_password               = "NetEnrichDevOps"
disk_size                   = "10"
user_labels = {
  "name"  = "mysql_netenrich"
  "owner" = "rvadisala"
}
database_flags = [
  {
    name  = "long_query_time"
    value = "0"
  }
]
additional_databases = [
  {
    name      = "apimgtdb"
    charset   = "utf8mb4"
    collation = "utf8mb4_general_ci"
  },
  {
    name      = "WSO2AM_DB"
    charset   = "utf8mb4"
    collation = "utf8mb4_general_ci"
  }
]
additional_users = [
  {
    name            = "rudra"
    password        = "redhat"
    host            = "localhost"
    type            = "BUILT_IN"
    random_password = false
  },
  {
    name            = "rvadisala"
    password        = "redhat"
    host            = "localhost"
    type            = "BUILT_IN"
    random_password = false
  },
]
ip_configuration = {
  ipv4_enabled                                  = true
  enable_private_path_for_google_cloud_services = false
  private_network                               = null
  require_ssl                                   = true
  allocated_ip_range                            = null
  authorized_networks = [
    {
      name  = "NE-LDAP"
      value = "103.217.239.36/32"
    },
  ]
}
insights_config = {
  query_insights_enabled  = true
  query_plans_per_minute  = 5
  query_string_length     = 1024
  record_application_tags = true
  record_client_address   = true
}
gcp_services_list = [
  "sqladmin.googleapis.com",
  "servicenetworking.googleapis.com",
  "compute.googleapis.com",
  "serviceusage.googleapis.com",
  "cloudresourcemanager.googleapis.com"
]

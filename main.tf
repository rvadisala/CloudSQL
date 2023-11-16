data "google_compute_network" "default" {
  name    = "default"
  project = var.project_id
}

resource "null_resource" "enable_service_usage_api" {
  provisioner "local-exec" {
    command = "gcloud services enable sql-component.googleapis.com sqladmin.googleapis.com servicenetworking.googleapis.com compute.googleapis.com cloudresourcemanager.googleapis.com --project ${var.project_id}"
  }
}


# Create an IP address
resource "google_compute_global_address" "private_ip_address" {
  provider      = google
  name          = "private-ip-allocation"
  project       = var.project_id
  purpose       = "VPC_PEERING" #https://cloud.google.com/compute/docs/reference/rest/v1/globalAddresses
  address_type  = "INTERNAL"
  prefix_length = 23
  network       = data.google_compute_network.default.id
}

resource "null_resource" "enable_private_connection" {
  provisioner "local-exec" {
    command = "gcloud beta services vpc-peerings update --service=servicenetworking.googleapis.com --ranges=private-ip-allocation --network=default --project=${var.project_id} --force"
  }
}

resource "time_sleep" "wait_project_init" {
  create_duration = "60s"

  depends_on = [null_resource.enable_service_usage_api, null_resource.enable_private_connection]
}


module "mysql" {
  source           = "./mysql"
  name             = "mysql57"
  project_id       = var.project_id
  database_version = "MYSQL_5_7"
  region           = "asia-south1"

  deletion_protection         = false
  deletion_protection_enabled = false

  disk_size                       = 10
  tier                            = "db-g1-small"
  zone                            = "asia-south1-a"
  availability_type               = "REGIONAL"
  maintenance_window_day          = 7
  maintenance_window_hour         = 12
  maintenance_window_update_track = "stable"

  database_flags = [{ name = "long_query_time", value = 1 }]

  user_labels = {
    owner    = "rvadisala",
    location = "india",
    business = "nedevops"
  }

  ip_configuration = {
    ipv4_enabled                                  = false
    require_ssl                                   = true
    private_network                               = data.google_compute_network.default.id
    enable_private_path_for_google_cloud_services = true
    allocated_ip_range                            = null
    authorized_networks = [
      {
        name  = "Ne-Ldap"
        value = "103.217.239.36/32"
      },
    ]
  }

  password_validation_policy_config = {
    enable_password_policy      = true
    complexity                  = "COMPLEXITY_DEFAULT"
    disallow_username_substring = true
    min_length                  = 8
  }

  backup_configuration = {
    enabled                        = true
    binary_log_enabled             = true
    start_time                     = "20:55"
    location                       = null
    transaction_log_retention_days = null
    retained_backups               = 365
    retention_unit                 = "COUNT"
  }

  db_name      = "nedevopsdb"
  db_charset   = "utf8mb4"
  db_collation = "utf8mb4_general_ci"

  additional_databases = [
    {
      name      = "apimgtdb"
      charset   = "utf8mb4"
      collation = "utf8mb4_general_ci"
    },
  ]

  user_name     = "nedevops"
  user_password = "NetEnrich@DevOps@123##"
  root_password = "MysqlR00T@123))(("

  additional_users = [
    {
      name            = "rvadisala"
      password        = "NetEnrich@123##"
      host            = "%"
      type            = "BUILT_IN"
      random_password = false
    },
    {
      name            = "rudra"
      password        = "NetEnrich@123@@"
      host            = "%"
      type            = "BUILT_IN"
      random_password = false
    },
  ]
  insights_config = {
    query_insights_enabled  = true
    query_plans_per_minute  = 5
    query_string_length     = 1024
    record_application_tags = true
    record_client_address   = true
  }

}

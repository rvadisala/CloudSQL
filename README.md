# google_sql_database_instance.default:
resource "google_sql_database_instance" "default" {
    available_maintenance_versions = []
    connection_name                = "ric-pod-automation:asia-south1:sriki"
    database_version               = "MYSQL_8_0_31"
    deletion_protection            = true
    first_ip_address               = "10.71.208.2"
    id                             = "sriki"
    instance_type                  = "CLOUD_SQL_INSTANCE"
    ip_address                     = [
        {
            ip_address     = "10.71.208.2"
            time_to_retire = ""
            type           = "PRIVATE"
        },
    ]
    maintenance_version            = "MYSQL_8_0_31.R20230909.02_07"
    name                           = "sriki"
    private_ip_address             = "10.71.208.2"
    project                        = "ric-pod-automation"
    region                         = "asia-south1"
    self_link                      = "https://sqladmin.googleapis.com/sql/v1beta4/projects/ric-pod-automation/instances/sriki"
    server_ca_cert                 = [
        {
            cert             = <<-EOT
                -----BEGIN CERTIFICATE-----
                MIIDfzCCAmegAwIBAgIBADANBgkqhkiG9w0BAQsFADB3MS0wKwYDVQQuEyQ1MDIx
                NDllMi1iNDJiLTQyZDMtYmEyZC05OWQyNzZmYTNlOTgxIzAhBgNVBAMTGkdvb2ds
                ZSBDbG91ZCBTUUwgU2VydmVyIENBMRQwEgYDVQQKEwtHb29nbGUsIEluYzELMAkG
                A1UEBhMCVVMwHhcNMjMxMTEzMTAyMDMzWhcNMzMxMTEwMTAyMTMzWjB3MS0wKwYD
                VQQuEyQ1MDIxNDllMi1iNDJiLTQyZDMtYmEyZC05OWQyNzZmYTNlOTgxIzAhBgNV
                BAMTGkdvb2dsZSBDbG91ZCBTUUwgU2VydmVyIENBMRQwEgYDVQQKEwtHb29nbGUs
                IEluYzELMAkGA1UEBhMCVVMwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
                AQCchMcICxZQQb6vma7daP1bx8zfaDVGDwVxJR+Il+UyIqfB0vzQ3mHlQsQPsRO1
                Gb4yIlvoTx0nwF8tkUCPy82cLf/iQhJq5bKzUEOsmQo/dH8eJAzkmrYZxAUpXMYL
                1LNYnVMxnrsQnPnrN003qBBhaCo3Hi21wmlWxImvbIDSkt+pdqowGjYtDlHscdEd
                uVulZr+WlZ8N6IfwTbIJk6zcTohKVKeJ+HMG+FmWp5IxQPF1gbRYmsokWujs5p6D
                TzcOAHZlklAGlKOr/ASl9cpuwePGJ1Xqurzb00Zree8aywdxsFLuS1i18a5OXAEL
                bf76ACbfvKv6EhWKlfPy3noJAgMBAAGjFjAUMBIGA1UdEwEB/wQIMAYBAf8CAQAw
                DQYJKoZIhvcNAQELBQADggEBACV4PpU6OeERddLPF0vHwp4h26RNtk7i7/g8FRCk
                NaUubHcZmJpX671xXsFzfHwhzTa7603K18hgoxiQxeaMk8LjENwnyanKYWDPQqOi
                k/RoRa+MP3HgcqBipPo7NQL1TubpnUdq0fYZExg+AiOTB+qzR+zzBmIt6zXvD7i+
                fn67O86gMlVCDjrBwVd5T3wCMRIPFrbmuVlMWMNiz0dgYHp8JPyfsg5ipbdEsrim
                /b7Dr4qmNEi7kKyzJCLmk6ws4Ri90MIjkVHbnFJNBIkdR0ygD6uAKrNaN+WnrzYb
                pwe3sH84SKVGPAq1E824lHZFxUD8/tL0Nd5uakyJO8g+sAk=
                -----END CERTIFICATE-----
            EOT
            common_name      = "C=US,O=Google\\, Inc,CN=Google Cloud SQL Server CA,dnQualifier=502149e2-b42b-42d3-ba2d-99d276fa3e98"
            create_time      = "2023-11-13T10:20:33.746Z"
            expiration_time  = "2033-11-10T10:21:33.746Z"
            sha1_fingerprint = "fce3fef35b7c3e1cb56a20acbcd548db103775c3"
        },
    ]
    service_account_email_address  = "p917967615223-094c8f@gcp-sa-cloud-sql.iam.gserviceaccount.com"

    settings {
        activation_policy           = "ALWAYS"
        availability_type           = "REGIONAL"
        connector_enforcement       = "NOT_REQUIRED"
        deletion_protection_enabled = true
        disk_autoresize             = true
        disk_autoresize_limit       = 0
        disk_size                   = 10
        disk_type                   = "PD_SSD"
        edition                     = "ENTERPRISE"
        pricing_plan                = "PER_USE"
        tier                        = "db-custom-1-3840"
        user_labels                 = {
            "name"  = "mysql_netenrich"
            "owner" = "rvadisala"
        }
        version                     = 4

        backup_configuration {
            binary_log_enabled             = true
            enabled                        = true
            location                       = "asia"
            point_in_time_recovery_enabled = false
            start_time                     = "00:00"
            transaction_log_retention_days = 7

            backup_retention_settings {
                retained_backups = 7
                retention_unit   = "COUNT"
            }
        }

        database_flags {
            name  = "long_query_time"
            value = "0"
        }

        insights_config {
            query_insights_enabled  = true
            query_plans_per_minute  = 5
            query_string_length     = 1024
            record_application_tags = true
            record_client_address   = true
        }

        ip_configuration {
            enable_private_path_for_google_cloud_services = true
            ipv4_enabled                                  = false
            private_network                               = "projects/ric-pod-automation/global/networks/default"
            require_ssl                                   = false
        }

        location_preference {
            zone = "asia-south1-a"
        }

        maintenance_window {
            day          = 6
            hour         = 19
            update_track = "stable"
        }

        password_validation_policy {
            complexity                  = "COMPLEXITY_DEFAULT"
            disallow_username_substring = true
            enable_password_policy      = true
            min_length                  = 8
            reuse_interval              = 1
        }
    }

    timeouts {}
}

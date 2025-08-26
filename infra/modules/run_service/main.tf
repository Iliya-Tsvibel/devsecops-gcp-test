resource "google_cloud_run_v2_service" "app" {
  name     = var.service_name
  location = var.region
  ingress  = "INGRESS_TRAFFIC_ALL"

  template {
    service_account = var.runtime_sa

    containers {
      image = var.image
      ports { container_port = 8080 }

      # Secret Manager → ENV
      env {
        name = "APP_TOKEN"
        value_source {
          secret_key_ref {
            secret  = var.app_secret_id
            version = "latest"
          }
        }
      }
    }

    scaling {
      min_instance_count = 0
      max_instance_count = 3
    }

    timeout = "60s"
  }
}

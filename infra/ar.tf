resource "google_artifact_registry_repository" "services" {
  location      = var.region
  repository_id = "services"
  format        = "DOCKER"
  description   = "DevSecOps interview images"
}

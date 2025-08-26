resource "google_storage_bucket" "app" {
  name     = var.name
  project  = var.project_id
  location = var.location

  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"
  force_destroy               = false

  versioning {
    enabled = true
  }

  lifecycle_rule {
    condition { num_newer_versions = 10 }
    action    { type = "Delete" }
  }
}

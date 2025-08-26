module "network" {
  source        = "./modules/network"
  project_id    = var.project_id
  region        = var.region
  network_name  = var.network_name
  subnet_name   = var.subnet_name
  ip_cidr_range = var.ip_cidr_range
}

module "run_service" {
  source        = "./modules/run_service"
  project_id    = var.project_id
  region        = var.region
  service_name  = var.service_name
  image         = var.image
  runtime_sa    = var.runtime_sa
  app_secret_id = var.app_secret_id
}

module "app_bucket" {
  source     = "./modules/app_bucket"
  project_id = var.project_id
  location   = var.region
  name       = var.app_bucket_name
}

module "app_secret" {
  source      = "./modules/secret_manager"
  project_id  = var.project_id
  secret_id   = var.app_secret_id
  secret_data = var.app_secret_value
}

resource "google_secret_manager_secret_iam_member" "app_secret_accessor" {
  project   = var.project_id
  secret_id = module.app_secret.secret_name
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:${var.runtime_sa}"
}

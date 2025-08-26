resource "google_compute_network" "vpc" {
  name                    = var.network_name
  project                 = var.project_id
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
}

resource "google_compute_subnetwork" "subnet" {
  name                     = var.subnet_name
  project                  = var.project_id
  region                   = var.region
  ip_cidr_range            = var.ip_cidr_range
  network                  = google_compute_network.vpc.self_link
  private_ip_google_access = true
}

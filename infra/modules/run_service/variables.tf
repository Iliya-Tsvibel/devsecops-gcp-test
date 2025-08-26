variable "project_id"   { type = string }
variable "region"       { type = string }
variable "service_name" { type = string }
variable "image"        { type = string } # europe-west1-docker.pkg.dev/<proj>/services/devsecops-demo:<tag>
variable "runtime_sa"   { type = string } # runtime-sa@<project>.iam.gserviceaccount.com

variable "app_secret_id" { type = string }

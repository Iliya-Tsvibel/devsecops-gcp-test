# deploy-sa может деплоить Cloud Run и писать образы в Artifact Registry
resource "google_project_iam_member" "deploy_run_developer" {
  project = var.project_id
  role    = "roles/run.developer"
  member  = "serviceAccount:deploy-sa@${var.project_id}.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "deploy_ar_writer" {
  project = var.project_id
  role    = "roles/artifactregistry.writer"
  member  = "serviceAccount:deploy-sa@${var.project_id}.iam.gserviceaccount.com"
}

# deploy-sa может "использовать" runtime-sa при деплое (impersonate)
resource "google_service_account_iam_member" "deploy_impersonate_runtime" {
  service_account_id = "projects/${var.project_id}/serviceAccounts/runtime-sa@${var.project_id}.iam.gserviceaccount.com"
  role               = "roles/iam.serviceAccountUser"
  member             = "serviceAccount:deploy-sa@${var.project_id}.iam.gserviceaccount.com"
}

# runtime-sa имеет доступ к секрету APP_TOKEN (мы уже выдаём через отдельный ресурс),
# но оставим привязку так, как реализовано сейчас:
# google_secret_manager_secret_iam_member.app_secret_accessor — уже есть в main.tf

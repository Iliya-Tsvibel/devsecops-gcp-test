project_id      = "involuted-tuner-469811-n3"
region          = "europe-west1"
tf_state_bucket = "tfstate-involuted-tuner-469811-n3"

network_name  = "devops-vpc"
subnet_name   = "devops-subnet"
ip_cidr_range = "10.10.0.0/24"

service_name = "devsecops-demo"
image        = "europe-west1-docker.pkg.dev/involuted-tuner-469811-n3/services/devsecops-demo:latest"
runtime_sa   = "runtime-sa@involuted-tuner-469811-n3.iam.gserviceaccount.com"

app_bucket_name = "app-involuted-tuner-469811-n3"

app_secret_id    = "APP_TOKEN"
app_secret_value = "demo-secret-value-please-rotate"

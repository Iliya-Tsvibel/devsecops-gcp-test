terraform {
  backend "gcs" {
    bucket  = "tfstate-involuted-tuner-469811-n3"
    prefix  = "terraform/state"
  }
}


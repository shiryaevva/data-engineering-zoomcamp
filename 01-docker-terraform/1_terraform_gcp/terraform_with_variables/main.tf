terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.40.0"
    }
  }
}

provider "google" {
  # Credentials only needs to be set if you do not have the GOOGLE_APPLICATION_CREDENTIALS set
  credentials = "./keys/my-creds.json"
  project     = "reflected-mark-431723-c4"
  region      = "us-central1"
}


resource "google_storage_bucket" "demo-bucket" {
  name          = "terraform-demo-bucket-reflected-mark-431723-c4"
  location      = "US"
  force_destroy = true


  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}
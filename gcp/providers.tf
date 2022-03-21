terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  credentials = file(".credentials")

  project = "320886568584"
  region  = local.region
  zone    = local.zone
}

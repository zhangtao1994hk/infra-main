terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = "project-ef3e3c7b-875b-4ab7-a17"
  region  = "us-central1"
}

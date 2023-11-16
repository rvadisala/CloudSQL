terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  credentials = file("/Volumes/DataDisk/smitha/ric-pod-automation-ba40e675b122.json")
}

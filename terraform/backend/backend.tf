terraform {
  backend "gcs" {
    bucket  = "my-bucket"
    prefix  = "terraform/state"
  }
}


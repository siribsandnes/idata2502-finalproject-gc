resource "google_storage_bucket" "terraform_state" {
  name     = "tf-state-${random_id.bucket_suffix.hex}"
  location = "US"

  versioning {
    enabled = true
  }

  lifecycle_rule {
    condition {
      age = 365
    }
    action {
      type = "Delete"
    }
  }
}

resource "random_id" "bucket_suffix" {
  byte_length = 2
}

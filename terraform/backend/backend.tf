terraform {
  backend "gcs" {
    bucket  = "idata2502-bucket-sirisandnes"
    prefix  = "terraform/state"
  }
}

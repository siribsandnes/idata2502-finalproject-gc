provider "google" {
  credentials = file(var.google_application_credentials)
  project     = "brave-aviary-400922"
  region      = "us-central1"
}

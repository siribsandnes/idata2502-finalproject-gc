provider "google" {
  credentials = file(var.google_application_credentials)
  project     = "brave-aviary-400922"
  region      = "us-central1"
}

variable "google_application_credentials" {
  description = "Path to the Google Cloud service account credentials JSON file"
  default     = "/Users/sirisandnes/Documents/Skole/brave-aviary-400922-0f08d237feca.json"
}
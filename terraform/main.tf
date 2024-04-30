provider "google" {
  credentials = file("/Users/sirisandnes/Documents/Skole/brave-aviary-400922-0f08d237feca.json")
  project     = "brave-aviary-400922"
  region      = "us-central1"
}

resource "google_compute_instance" "default" {
  name         = "web-server"
  machine_type = "e2-micro"
  zone         = "us-central1-a"
  tags         = ["http-server"]

  boot_disk {
    initialize_params {
      image = "debian-10-buster-v20240417"
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP
    }
  }

  metadata_startup_script = <<-EOS
    #!/bin/bash
    apt-get update
    apt-get install -y nginx
    systemctl start nginx
    systemctl enable nginx
    echo '<!DOCTYPE html>
    <html>
    <head>
        <title>IDATA 2502 - Final Project</title>
    </head>
    <body>
        <h1>Welcome to My Website Hosted on Google Cloud VM</h1>
        <p>This if for a final project in the course IDATA502</p>
    </body>
    </html>' > /var/www/html/index.html
  EOS
}

output "ip" {
  value = google_compute_instance.default.network_interface[0].access_config[0].nat_ip
}

resource "google_storage_bucket" "my-bucket" {
  name                     = "sona-demogcp125"
  project                  = "test-terraform-438504"
  location                 = "US"
  force_destroy            = true
  public_access_prevention = "enforced"
}

# Configure the Google Cloud provider
provider "google" {
  project = var.project_id
  region  = var.region
}

# Create a network
resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

# Create a firewall rule to allow traffic
resource "google_compute_firewall" "default" {
  name    = "allow-http-ssh"
  network = google_compute_network.vpc_network.self_link

  allow {
    protocol = "tcp"
    ports    = ["22", "80"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# Create an instance (VM)
resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "e2-medium"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name

    access_config {
      # Ephemeral public IP
    }
  }

  tags = ["http-server", "ssh-server"]

  metadata_startup_script = <<-EOT
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y apache2
    sudo systemctl start apache2
    sudo systemctl enable apache2
  EOT
}


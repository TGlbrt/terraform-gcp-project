provider "google" {
  project = "test-project-azdevops"
}

resource "google_compute_instance" "default" {
  name         = "test-vm"
  machine_type = "n1-standard-1"
  zone         = "europe-west2-c"

  tags = ["test", "vm"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
}

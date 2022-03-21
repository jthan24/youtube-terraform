resource "google_compute_instance" "devops-virtualmachine" {
  name         = "devops-vm-${var.proyecto}"
  machine_type = "f1-micro"
  zone         = local.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.devops-subnet[0].name
    access_config {
    }
  }

  tags = local.tags
  labels = {
    centrocostos = "elarea",
    gestionado   = "terraform"
  }
}
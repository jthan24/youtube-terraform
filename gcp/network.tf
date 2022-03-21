resource "google_compute_network" "devops-vnet" {
  name                    = "devops-network"
  auto_create_subnetworks = false
}


resource "google_compute_subnetwork" "devops-subnet" {
  count         = length(local.address_prefixes)
  name          = "devops-subnet-${count.index}-${var.proyecto}"
  ip_cidr_range = local.address_prefixes[count.index]
  region        = local.region
  network       = google_compute_network.devops-vnet.id
}

resource "google_compute_firewall" "devops-firewall" {
  name    = "devops-firewall-${var.proyecto}"
  network = google_compute_network.devops-vnet.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  source_tags = ["all-trafic"]
}
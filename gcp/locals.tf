locals {
  region = "us-central1"
  zone   = "us-central1-c"

  tags = concat(["dev", "aa999999", "terraform"], var.tags)

  address_prefixes = ["10.0.1.0/24", "10.0.2.0/24"]
}
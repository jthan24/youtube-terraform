locals {
  location = "West Central US"

  tags = merge(
    {
      environment = "dev"
      cost_center = "999999"
      managed_by  = "terraform"
    },
    var.tags
  )

  address_prefixes = ["10.0.1.0/24", "10.0.2.0/24"]
}
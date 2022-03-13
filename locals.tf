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
}
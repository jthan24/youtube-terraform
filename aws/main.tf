module "networking" {

  source = "./modules/network"

  proyecto = var.proyecto
  tags     = var.tags
  zonas_disponibilidad = [
    "eu-west-1a",
    "eu-west-1b",
    "eu-west-1c"
  ]

}


module "ec2" {
  source = "./modules/ec2"

  proyecto = "${var.proyecto}-ec2"
  tags     = var.tags

  vpc = {
    id         = module.networking.vpc_id
    cidr_block = module.networking.vpc_cidr
  }
  subnet_id = module.networking.subnets_publicas[0].id
}

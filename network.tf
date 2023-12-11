# main.tf

# VPC and Subnets - Production Shared
module "cs-vpc-prod-shared" {
  source  = "terraform-google-modules/network/google"
  version = "~> 5.0"

  project_id   = var.cs_vpc_prod_shared_project_id
  network_name = var.cs_vpc_prod_shared_network_name

  subnets = var.cs_vpc_prod_shared_subnets

  firewall_rules = var.cs_vpc_prod_shared_firewall_rules
}

# VPC and Subnets - Non-production Shared
module "cs-vpc-nonprod-shared" {
  source  = "terraform-google-modules/network/google"
  version = "~> 5.0"

  project_id   = var.cs_vpc_nonprod_shared_project_id
  network_name = var.cs_vpc_nonprod_shared_network_name

  subnets = var.cs_vpc_nonprod_shared_subnets

  firewall_rules = var.cs_vpc_nonprod_shared_firewall_rules
}

# main.tf

# Module for the common folder
module "cs-common" {
  source  = "terraform-google-modules/folders/google"
  version = "~> 3.2"

  parent = var.cs_common_parent
  names  = var.cs_common_names
}

# Module for the teams folders
module "cs-teams" {
  source  = "terraform-google-modules/folders/google"
  version = "~> 3.2"

  parent = var.cs_teams_parent
  names  = var.cs_teams_names
}

# Module for the environments folders
module "cs-envs" {
  for_each = module.cs-teams.ids
  source   = "terraform-google-modules/folders/google"
  version  = "~> 3.2"

  parent = var.cs_envs_parent
  names  = var.cs_envs_names
}

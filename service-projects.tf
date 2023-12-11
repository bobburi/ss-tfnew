# main.tf

# Module for Team 1 Production Service
module "cs-svc-team-1-prod-svc-qo2y" {
  source  = "terraform-google-modules/project-factory/google//modules/svpc_service_project"
  version = "~> 14.2"

  name            = "team-1-prod-service"
  project_id      = "team-1-prod-svc-qo2y"
  org_id          = var.org_id
  billing_account = var.billing_account
  folder_id       = var.cs_svc_team_1_folder_id_production

  shared_vpc            = module.cs-vpc-prod-shared.project_id
  shared_vpc_subnets    = [try(module.cs-vpc-prod-shared.subnets["asia-east1/subnet-prod-1"].self_link, "")]
  domain                = data.google_organization.org.domain
  group_name            = module.cs-gg-team-1-prod-service.name
  group_role            = "roles/viewer"
}

# Module for Team 1 Non-Production Service
module "cs-svc-team-1-nonprod-svc-qo2y" {
  source  = "terraform-google-modules/project-factory/google//modules/svpc_service_project"
  version = "~> 14.2"

  name            = "team-1-nonprod-service"
  project_id      = "team-1-nonprod-svc-qo2y"
  org_id          = var.org_id
  billing_account = var.billing_account
  folder_id       = var.cs_svc_team_1_folder_id_non_production

  shared_vpc            = module.cs-vpc-nonprod-shared.project_id
  shared_vpc_subnets    = [try(module.cs-vpc-nonprod-shared.subnets["us-east1/subnet-non-prod-1"].self_link, "")]
  domain                = data.google_organization.org.domain
  group_name            = module.cs-gg-team-1-nonprod-service.name
  group_role            = "roles/viewer"
}

# Module for Team 2 Production Service
module "cs-svc-team-2-prod-svc-qo2y" {
  source  = "terraform-google-modules/project-factory/google//modules/svpc_service_project"
  version = "~> 14.2"

  name            = "team-2-prod-service"
  project_id      = "team-2-prod-svc-qo2y"
  org_id          = var.org_id
  billing_account = var.billing_account
  folder_id       = var.cs_svc_team_2_folder_id_production

  shared_vpc            = module.cs-vpc-prod-shared.project_id
  shared_vpc_subnets    = [try(module.cs-vpc-prod-shared.subnets["asia-east2/subnet-prod-2"].self_link, "")]
  domain                = data.google_organization.org.domain
  group_name            = module.cs-gg-team-2-prod-service.name
  group_role            = "roles/viewer"
}

# Module for Team 2 Non-Production Service
module "cs-svc-team-2-nonprod-svc-qo2y" {
  source  = "terraform-google-modules/project-factory/google//modules/svpc_service_project"
  version = "~> 14.2"

  name            = "team-2-nonprod-service"
  project_id      = "team-2-nonprod-svc-qo2y"
  org_id          = var.org_id
  billing_account = var.billing_account
  folder_id       = var.cs_svc_team_2_folder_id_non_production

  shared_vpc            = module.cs-vpc-nonprod-shared.project_id
  shared_vpc_subnets    = [try(module.cs-vpc-nonprod-shared.subnets["us-central1/subnet-non-prod-2"].self_link, "")]
  domain                = data.google_organization.org.domain
  group_name            = module.cs-gg-team-2-nonprod-service.name
  group_role            = "roles/viewer"
}

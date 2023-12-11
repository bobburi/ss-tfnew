variable "billing_account" {
  description = "The ID of the billing account to associate projects with"
  type        = string
  default     = "<please enter your billing account number here>"
}

variable "org_id" {
  description = "The organization id for the associated resources"
  type        = string
  default     = "746763651755"
}
####folders#####


# cs-common-variables.tf

variable "cs_common_parent" {
  description = "The parent folder for cs-common"
  default     = "organizations/${var.org_id}"
}

variable "cs_common_names" {
  description = "List of names for cs-common"
  default     = ["Common"]
}

# cs-teams-variables.tf

variable "cs_teams_parent" {
  description = "The parent folder for cs-teams"
  default     = "organizations/${var.org_id}"
}

variable "cs_teams_names" {
  description = "List of names for cs-teams"
    type        = list(string)
  default     = ["Team 1", "Team 2", "Team 3"]
}

# cs-envs-variables.tf

variable "cs_envs_parent" {
  description = "The parent folder for cs-envs"
}

variable "cs_envs_names" {
  description = "List of names for cs-envs"
    type        = list(string)
  default     = ["Production", "Non-Production", "Development"]
}


####projects #####


variable "cs_vpc_host_name" {
  description = "The name of the VPC Host project"
}

variable "cs_vpc_host_project_id" {
  description = "The project ID for the VPC Host project"
}

variable "cs_vpc_host_enable_shared_vpc_host_project" {
  description = "Flag to enable shared VPC host project"
  default     = false
}


variable "nonprod_hostname" {
  description = "The name of the VPC Host project"
}

variable "nonprod_hostid" {
  description = "The project ID for the VPC Host project"
}



########################## Network variables ##################################################3

variable "cs_vpc_prod_shared_project_id" {
  description = "The GCP project ID for the production shared VPC."
}

variable "cs_vpc_prod_shared_network_name" {
  description = "The name of the production shared VPC."
}

variable "cs_vpc_prod_shared_subnets" {
  description = "The list of subnets for the production shared VPC."
  type        = list(object({
    subnet_name               = string
    subnet_ip                 = string
    subnet_region             = string
    subnet_private_access     = bool
    subnet_flow_logs          = bool
    subnet_flow_logs_sampling = string
    subnet_flow_logs_metadata = string
    subnet_flow_logs_interval = string
  }))
}

variable "cs_vpc_prod_shared_firewall_rules" {
  description = "The list of firewall rules for the production shared VPC."
  type        = list(object({
    name       = string
    direction  = string
    priority   = number
    log_config = map(string)
    allow      = list(object({
      protocol = string
      ports    = list(string)
    }))
    ranges     = list(string)
  }))
}

variable "cs_vpc_nonprod_shared_project_id" {
  description = "The GCP project ID for the non-production shared VPC."
}

variable "cs_vpc_nonprod_shared_network_name" {
  description = "The name of the non-production shared VPC."
}

variable "cs_vpc_nonprod_shared_subnets" {
  description = "The list of subnets for the non-production shared VPC."
  type        = list(object({
    subnet_name               = string
    subnet_ip                 = string
    subnet_region             = string
    subnet_private_access     = bool
    subnet_flow_logs          = bool
    subnet_flow_logs_sampling = string
    subnet_flow_logs_metadata = string
    subnet_flow_logs_interval = string
  }))
}

variable "cs_vpc_nonprod_shared_firewall_rules" {
  description = "The list of firewall rules for the non-production shared VPC."
  type        = list(object({
    name       = string
    direction  = string
    priority   = number
    log_config = map(string)
    allow      = list(object({
      protocol = string
      ports    = list(string)
    }))
    ranges     = list(string)
  }))
}

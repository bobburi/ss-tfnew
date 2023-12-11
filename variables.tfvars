####folders
cs_teams_names = ["Team 1", "Team 2", "Team 3"]
cs_envs_names = ["Production", "Non-Production", "Development"]
cs_envs_parent = module.cs-teams.ids["Team 1"]  # Replace "Team 1" with the specific team name you want to use

###  Projects######

cs_vpc_host_name = "prod-sharedproject"
cs_vpc_host_project_id = "prod-sharedproject-1230"
nonprod_hostname = "nonprod-sharedhost"
nonprod_hostid = "nonprod-sharedhost-223"

# variables.tfvars

cs_vpc_prod_shared_project_id   = "sharedproject-407813"
cs_vpc_prod_shared_network_name = "vpc-prod-shared"

cs_vpc_prod_shared_subnets = [
  {
    subnet_name               = "subnet-prod-1"
    subnet_ip                 = "10.10.0.0/24"
    subnet_region             = "asia-east1"
    subnet_private_access     = true
    subnet_flow_logs          = true
    subnet_flow_logs_sampling = "0.5"
    subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
    subnet_flow_logs_interval = "INTERVAL_10_MIN"
  },
  {
    subnet_name               = "subnet-prod-2"
    subnet_ip                 = "10.10.1.0/24"
    subnet_region             = "asia-east2"
    subnet_private_access     = true
    subnet_flow_logs          = true
    subnet_flow_logs_sampling = "0.5"
    subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
    subnet_flow_logs_interval = "INTERVAL_10_MIN"
  },
]

cs_vpc_prod_shared_firewall_rules = [
  {
    name      = "vpc-prod-shared-allow-icmp"
    direction = "INGRESS"
    priority  = 10000
    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }
    allow = [
      {
        protocol = "icmp"
        ports    = []
      }
    ]
    ranges = [
      "10.128.0.0/9",
    ]
  },
  {
    name      = "vpc-prod-shared-allow-ssh"
    direction = "INGRESS"
    priority  = 10000
    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }
    allow = [
      {
        protocol = "tcp"
        ports    = ["22"]
      }
    ]
    ranges = [
      "35.235.240.0/20",
    ]
  },
  {
    name      = "vpc-prod-shared-allow-rdp"
    direction = "INGRESS"
    priority  = 10000
    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }
    allow = [
      {
        protocol = "tcp"
        ports    = ["3389"]
      }
    ]
    ranges = [
      "35.235.240.0/20",
    ]
  },
]

cs_vpc_nonprod_shared_project_id   = "sharedproject-nonprod"
cs_vpc_nonprod_shared_network_name = "vpc-nonprod-shared"

cs_vpc_nonprod_shared_subnets = [
  {
    subnet_name               = "subnet-non-prod-1"
    subnet_ip                 = "10.10.2.0/24"
    subnet_region             = "us-east1"
    subnet_private_access     = true
    subnet_flow_logs          = true
    subnet_flow_logs_sampling = "0.5"
    subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
    subnet_flow_logs_interval = "INTERVAL_10_MIN"
  },
  {
    subnet_name               = "subnet-non-prod-2"
    subnet_ip                 = "10.10.3.0/24"
    subnet_region             = "us-central1"
    subnet_private_access     = true
    subnet_flow_logs          = true
    subnet_flow_logs_sampling = "0.5"
    subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
    subnet_flow_logs_interval = "INTERVAL_10_MIN"
  },
]

cs_vpc_nonprod_shared_firewall_rules = [
  {
    name      = "vpc-nonprod-shared-allow-icmp"
    direction = "INGRESS"
    priority  = 10000
    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }
    allow = [
      {
        protocol = "icmp"
        ports    = []
      }
    ]
    ranges = [
      "10.128.0.0/9",
    ]
  },
  {
    name      = "vpc-nonprod-shared-allow-ssh"
    direction = "INGRESS"
    priority  = 10000
    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }
    allow = [
      {
        protocol = "tcp"
        ports    = ["22"]
      }
    ]
    ranges = [
      "35.235.240.0/20",
    ]
  },
  {
    name      = "vpc-nonprod-shared-allow-rdp"
    direction = "INGRESS"
    priority  = 10000
    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }
    allow = [
      {
        protocol = "tcp"
        ports    = ["3389"]
      }
    ]
    ranges = [
      "35.235.240.0/20",
    ]
  },
]



##########service projects

# cs-svc-team-1-variables.tfvars

cs_svc_team_1_folder_id_production   = module.cs-envs["Team 1"].ids["Production"]
cs_svc_team_1_folder_id_non_production = module.cs-envs["Team 1"].ids["Non-Production"]
# cs-svc-team-2-variables.tfvars

cs_svc_team_2_folder_id_production   = module.cs-envs["Team 2"].ids["Production"]
cs_svc_team_2_folder_id_non_production = module.cs-envs["Team 2"].ids["Non-Production"]

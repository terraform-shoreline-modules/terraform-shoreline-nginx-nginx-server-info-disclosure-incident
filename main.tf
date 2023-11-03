terraform {
  required_version = ">= 0.13.1"

  required_providers {
    shoreline = {
      source  = "shorelinesoftware/shoreline"
      version = ">= 1.11.0"
    }
  }
}

provider "shoreline" {
  retries = 2
  debug = true
}

module "nginx_server_info_disclosure_incident" {
  source    = "./modules/nginx_server_info_disclosure_incident"

  providers = {
    shoreline = shoreline
  }
}
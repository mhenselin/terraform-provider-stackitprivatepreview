terraform {
  required_providers {
    stackitprivatepreview = {
      source = "registry.terraform.io/stackitcloud/stackitprivatepreview"
      version = "~> 0.1"
    }
  }
}

provider "stackitprivatepreview" {
  default_region        = "eu01"
  enable_beta_resources = true
  service_account_key_path = "./service_account.json"
}

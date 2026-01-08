terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.52.0"
    }
  }
}

# terraform {
#   backend "azurerm" {
#     use_oidc             = true                                    # Can also be set via `ARM_USE_OIDC` environment variable.
#     use_azuread_auth     = true                                    # Can also be set via `ARM_USE_AZUREAD` environment variable.
#     tenant_id            = "00000000-0000-0000-0000-000000000000"  # Can also be set via `ARM_TENANT_ID` environment variable.
#     client_id            = "00000000-0000-0000-0000-000000000000"  # Can also be set via `ARM_CLIENT_ID` environment variable.
#     storage_account_name = "hcl_backend_storage"                              # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
#     container_name       = "tfstate"                               # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
#     key                  = "prod.terraform.tfstate"                # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
#   }
# }


provider "azurerm" {
  features {}
  subscription_id = "1a39c6ac-4bf8-406a-be20-298e2ae5b5ce"
  # Configuration options
}
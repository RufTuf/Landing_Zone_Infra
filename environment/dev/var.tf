variable "hcl_rg1" {
  description = "hcl ka rg naam"
  type = map(object({
    name       = string
    location   = string
    managed_by = string
    tags       = map(string)
  }))


}

variable "hcl_vnet1" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    dns_servers         = list(string)
    tags                = optional(map(string), {})
    subnets = optional(list(object({
      name             = string
      address_prefixes = list(string)
    })), [])
  }))
}

variable "hcl_pip1" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    allocation_method   = string
    tags                = optional(map(string), {})
  }))

}

variable "hcl_sql_databases1" {
  description = "sql data base"
  type = map(object({
    name         = string
    server_id    = string
    collation    = string
    license_type = string
    max_size_gb  = string
    sku_name     = string
    enclave_type = string
  }))

}


variable "hcl_sql_servers1" {
  description = "the name of sql server"
  type = map(object({
    name                         = string
    resource_group_name          = string
    location                     = string
    version                      = string
    administrator_login          = string
    administrator_login_password = string
  }))

}

variable "subnet2" {
  type = map(object({
    name                 = string
    virtual_network_name = string
    resource_group_name  = string

  }))

}

variable "hcl_nic1" {
  type = map(object({
    nic_name = string
    location = string
    rg_name  = string
  }))
}

variable "hcl_vms1" {
  description = "VM configurations"
  type = map(object({
    nic_name       = string
    location       = string
    rg_name        = string
    vnet_name      = string
    subnet_name    = string
    pip_name       = string
    vm_name        = string
    size           = string
    admin_username = string
    admin_ssh_key = object({
      public_key = string
    })
    admin_password                  = optional(string, null)
    disable_password_authentication = bool
    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
  }))

  validation {
    condition     = alltrue([for vm in var.hcl_vms1 : startswith(vm.size, "Standard_")])
    error_message = "All VM sizes must be valid Azure sizes and start with 'Standard_'."
  }
}

variable "hcl_kv_secrets1" {
  description = "Key Vault secrets map input"
  type = map(object({
    name                = string
    resource_group_name = string
  }))
  default = {}
}
variable "hcl_kv_access_policy1" {
  description = "Key Vault access policy map input"
  type = map(object({
    object_id = string
    tenant_id = string
  }))
  default = {}
}

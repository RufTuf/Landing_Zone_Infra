variable "vms" {
  description = "Map of VM definitions keyed by name"
  type = map(object({
    resource_group_name             = string
    location                        = string
    vm_size                         = string
    admin_username                  = string
    disable_password_authentication = bool
    storage_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
    nic_id        = string
    admin_password = optional(string, null)
    admin_ssh_key = optional(object({
      public_key = string
    }))
  }))

  validation {
    condition = alltrue([for k, vm in var.vms : (
      vm.disable_password_authentication || (try(vm.admin_password, null) != null) || (try(vm.admin_ssh_key, null) != null)
    )])
    error_message = "If 'disable_password_authentication' is false for any VM, you must supply either 'admin_password' or 'admin_ssh_key.public_key'."
  }
}

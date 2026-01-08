variable "hcl_vnet" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    dns_servers         = list(string)
    tags = optional(map(string), {})

    subnets = optional(list(object({
      name             = string
      address_prefixes = list(string)
    })), [])
  }))
}

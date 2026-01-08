output "public_ip" {
  value = { for k, v in azurerm_public_ip.hclpip : k => {
    name           = v.name
    id             = v.id
    location       = v.location
    ip_address     = v.ip_address
    fqdn           = v.fqdn
    allocatione    = v.allocation_method
    resource_group = v.resource_group_name

    }
  }
}

resource "azurerm_network_interface" "nic" {
  for_each            = var.hcl_nic
  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
  location            = each.value.location 

  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = each.value.subnet_id # include in object if you need
    private_ip_address_allocation = "Dynamic"
  }
}

output "nic_ids" {
  value = { for k, v in azurerm_network_interface.nic : v.name => v.id }
}

data "azurerm_subnet" "subnets" {
  for_each = var.subnet1
  name                 = each.value.name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

output "subnet_ids" {
  value = { for k, v in data.azurerm_subnet.subnets : k => v.id }
}
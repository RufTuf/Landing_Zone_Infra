
resource "azurerm_linux_virtual_machine" "vms" {
  for_each            = var.vms
  name                = each.key
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = "Standard_F2"

  network_interface_ids = [
    each.value.nic_id
  ]

  admin_username                  = each.value.admin_username
  admin_password                  = each.value.admin_password
  disable_password_authentication = each.value.disable_password_authentication

  admin_ssh_key {
    username   = each.value.admin_username
    public_key = each.value.admin_ssh_key.public_key
  }
 
  source_image_reference {
    publisher = each.value.storage_image_reference.publisher
    offer     = each.value.storage_image_reference.offer
    sku       = each.value.storage_image_reference.sku
    version   = each.value.storage_image_reference.version
  }

 os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

}
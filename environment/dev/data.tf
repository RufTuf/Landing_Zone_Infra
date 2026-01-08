data "azurerm_key_vault_secret" "vm_userid" {
  name         = "username"
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "password" {
  name         = "password"
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault" "kv" {
  name                = "hcl-key-001"
  resource_group_name = "rg-kv"

}

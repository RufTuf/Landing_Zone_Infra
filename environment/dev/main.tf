module "hclrg" {
  source = "../../module/azurerm_resource_group"
  hcl_rg = var.hcl_rg1

}

module "compute" {
  depends_on = [module.nic]
  source     = "../../module/azurerm_compute"
  vms = {
    for k, v in var.hcl_vms1 : k => {
      resource_group_name             = v.rg_name
      location                        = v.location
      vm_size                         = v.size
      nic_id                          = module.nic.nic_ids[v.nic_name]
      admin_username                  = v.admin_username
      admin_ssh_key                   = v.admin_ssh_key
      disable_password_authentication = v.disable_password_authentication
      storage_image_reference         = v.source_image_reference
      admin_password                  = v.admin_password
    }
  }
}

module "hcl_vnet" {
  depends_on = [module.hclrg]
  source     = "../../module/azurerm_networks"
  hcl_vnet   = var.hcl_vnet1
}

module "public_ip" {
  depends_on = [module.hcl_vnet]
  source     = "../../module/azurerm_public_ip"
  hcl_pip    = var.hcl_pip1

}

module "sql_database" {
  depends_on        = [module.sql_server]
  source            = "../../module/azurerm_sql_database"
  hcl_sql_databases = var.hcl_sql_databases1
}

module "sql_server" {
  depends_on      = [module.public_ip]
  source          = "../../module/azurerm_sql_server"
  hcl_sql_servers = var.hcl_sql_servers1

}

module "subnet_data_block" {
  depends_on = [module.hcl_vnet]
  source     = "../../module/azurerm_subnet_data"
  subnet1    = var.subnet2
}

module "nic" {
  depends_on = [module.subnet_data_block]
  source     = "../../module/azurerm_network_interface"
  hcl_nic = {
    for k, v in var.hcl_nic1 : k => {
      nic_name  = v.nic_name
      location  = v.location
      rg_name   = v.rg_name
      subnet_id = module.subnet_data_block.subnet_ids[k]
    }
  }
}


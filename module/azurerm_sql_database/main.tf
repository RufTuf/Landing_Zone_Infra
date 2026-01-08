resource "azurerm_mssql_database" "sql_database" {
    for_each = var.hcl_sql_databases
  name         = each.value.name
  server_id    = each.value.server_id
  collation    = each.value.collation
  license_type = each.value.license_type
  max_size_gb  = each.value.max_size_gb
  sku_name     = each.value.sku_name
  enclave_type = "VBS"

}
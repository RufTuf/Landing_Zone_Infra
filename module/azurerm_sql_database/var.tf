variable "hcl_sql_databases" {
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
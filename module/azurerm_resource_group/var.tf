variable "hcl_rg" {
  description = "hcl ka rg naam"
  type = map(object({
    name       = string
    location   = string
    managed_by = string
    tags       = map(string)
  }))


}
    

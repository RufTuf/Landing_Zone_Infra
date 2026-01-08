variable "hcl_nic" {
  type = map(object({
    nic_name  = string
    location  = string
    rg_name   = string
    subnet_id = string
  }))
}
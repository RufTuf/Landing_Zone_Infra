variable "subnet1" {
  type = map(object({
    name                 = string
    virtual_network_name = string
    resource_group_name  = string
  }))
  description = "Map of subnet configurations for data lookup"
}
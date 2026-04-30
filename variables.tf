variable "project" {
  type = string
}

variable "resource_groups" {
  type = map(object({
    location = string
  }))
}

variable "storage_accounts" {
  type = list(object({
    name        = string
    rg          = string
    tier        = string
    replication = string
  }))
}

variable "virtual_networks" {
  type = map(object({
    rg             = string
    address_space  = list(string)
    enable_subnets = bool
    subnets = map(object({
      address_prefix = string
    }))
  }))
}

variable "vms" {
  type = list(object({
    name = string
    rg   = string
    vnet = string
    size = string
  }))
}

variable "admin_username" {}
variable "admin_password" {}

variable "create_vm" {
  default = true
}

variable "create_public_ip" {
  default = true
}

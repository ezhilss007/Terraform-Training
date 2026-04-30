variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "address_space" {
  type = list(string)
}

variable "subnets" {
  type = map(object({
    address_prefix = string
  }))
}

variable "subnet_id" {
  type = string
}

variable "public_ip_id" {
  type = string
}

variable "size" {
  type = string
}

variable "admin" {
  type = string
}

variable "password" {
  type = string
  sensitive = true
}

variable "storage_account_name" {
  type = string
}

variable "tier" {
  type = string
}

variable "replication" {
  type = string
}

variable "tags" {
  type = map(string)
}
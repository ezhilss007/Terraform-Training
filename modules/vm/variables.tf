variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "size" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "public_ip_id" {
  type = string
}

variable "admin" {
  type = string
}

variable "password" {
  type      = string
  sensitive = true
}

variable "tags" {
  type = map(string)
}

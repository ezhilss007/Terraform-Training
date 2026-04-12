variable "resourcegroup_name" {
   description = "Please enter the resource group name"
   type = string

}

variable "location" {
  description = "please enter the location"
  type = string
  default = "East US"
  
}

variable "storageaccount_name" {
   description = "Enter the storage account name"
   type = string
}
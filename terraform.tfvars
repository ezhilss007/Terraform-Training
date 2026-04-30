project = "demo"

resource_groups = {
  core = { location = "East US" }
}

storage_accounts = [
  {
    name        = "sa1"
    rg          = "core"
    tier        = "Standard"
    replication = "LRS"
  }
]

virtual_networks = {
  vnet1 = {
    rg             = "core"
    address_space  = ["10.0.0.0/16"]
    enable_subnets = true

    subnets = {
      default = {
        address_prefix = "10.0.1.0/24"
      }
    }
  }
}

vms = [
  {
    name = "vm1"
    rg   = "core"
    vnet = "vnet1"
    size = "Standard_B1s"
  }
]

admin_username = "azureuser"
admin_password = "Password1234!"

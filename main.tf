# -------------------------
# Resource Groups (for_each)
# -------------------------
module "rg" {
  source = "./modules/rg"

  for_each = var.resource_groups
  name     = "${local.prefix}-${each.key}"
  location = each.value.location
  tags     = local.common_tags
}

# -------------------------
# Storage Accounts (for_each from map)
# -------------------------
module "storage" {
  source = "./modules/storage"

  for_each = local.storage_map

  name                = "${local.prefix}storage"
  resource_group_name = module.rg[each.value.rg].name
  location            = module.rg[each.value.rg].location
  tier                = each.value.tier
  replication         = each.value.replication

  tags = local.common_tags
}

# -------------------------
# Network (for_each + dynamic)
# -------------------------
module "network" {
  source = "./modules/network"

  for_each = var.virtual_networks

  name                = "${local.prefix}-${each.key}"
  location            = module.rg[each.value.rg].location
  resource_group_name = module.rg[each.value.rg].name
  address_space       = each.value.address_space

  subnets = each.value.enable_subnets ? each.value.subnets : {}

  tags = local.common_tags
}

# -------------------------
# Public IP (conditional)
# -------------------------
resource "azurerm_public_ip" "pip" {
  count = var.create_public_ip ? 1 : 0

  name                = "${local.prefix}-pip"
  location            = module.rg["core"].location
  resource_group_name = module.rg["core"].name
  allocation_method   = "Static"
  sku                 = "Basic"
}

# -------------------------
# VM (count + conditional + references)
# -------------------------
module "vm" {
  source = "./modules/vm"

  count = var.create_vm ? length(var.vms) : 0

  name                = "${local.prefix}-${var.vms[count.index].name}"
  location            = module.rg[var.vms[count.index].rg].location
  resource_group_name = module.rg[var.vms[count.index].rg].name
  subnet_id           = module.network[var.vms[count.index].vnet].subnet_ids["default"]

  public_ip_id = var.create_public_ip ? azurerm_public_ip.pip[0].id : null

  size     = var.vms[count.index].size
  admin    = var.admin_username
  password = var.admin_password

  tags = local.common_tags
}

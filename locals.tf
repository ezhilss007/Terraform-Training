locals {
  env = terraform.workspace

  prefix = "${var.project}${local.env}"
  #demo-dev
  common_tags = {
    project = var.project
    env     = local.env
  }

  # map transformation example
  storage_map = {
    for sa in var.storage_accounts :
    sa.name => sa
  }
}

module "storageaccount" {
  source = "./storage"

  account_name              = var.account_name
  resource_group_name       = var.resource_group_name
  location                  = var.location
  account_kind              = var.account_kind
  account_replication_type  = var.account_replication_type
  access_tier               = var.access_tier
  whitelistip               = var.whitelistip
  subnet_id                 = var.subnet_id
  container_name            = var.container_name
  file_share_name     		= var.file_share_name
  size_quota                        = var.size_quota  
  azure_private_endpoint_name   = var.azure_private_endpoint_name
  private_endpoint_subnet  = var.private_endpoint_subnet
  azure_private_service_connection_name = var.azure_private_service_connection_name
}

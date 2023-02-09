variable "account_name" {
  description = "Azure storage account name."
}

variable account_kind {
  description = "Azure storage Account Kind."
}

variable location {
  description = "Azure Resource Location"
}

variable account_replication_type {
  description = "Azure storage account Replication Type."
}

variable access_tier {
  description = "Azure storage accnt access tier."
}

variable container_name {
  description = "Azure storage account container name."
}

variable "file_share_name" {
  description = "Azure storage account file share name."
}

variable "size_quota" {
  description = "Azure storage account file share size quota."
}

variable resource_group_name {
  description = "Azure Resource Group name."
}

variable subnet_id {
  description = "Azure subnet id."
  type = list(string)
}

variable azure_private_endpoint_name {
  description = "Azure Storage account private endpoint name."
}

variable azure_private_service_connection_name {
  description = "Azure Storage account private service connection name."
}

variable whitelistip {
  description = "Azure Storage account whitelistip."
  type = list(string)
}

variable private_endpoint_subnet {
  description = "Azure storage Private endpoint subnet id"
  type = string
}

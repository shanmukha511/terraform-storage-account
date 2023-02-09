locals {

   ip_rules = [
     "",
     "1.1.1.1",
     "2.2.2.2"
   ]  
}

locals {

   subnet_id = [
     ""
   ]
  
}

resource "azurerm_storage_account" "example" {
  name                      = var.account_name
  resource_group_name       = var.resource_group_name
  location                  = var.location
  account_kind              = var.account_kind
  account_replication_type  = var.account_replication_type
  access_tier               = var.access_tier
  is_hns_enabled            = "true"
  account_tier              = "Standard"
  min_tls_version           = "TLS1_2"
  nfsv3_enabled 	    	= true
  large_file_share_enabled  = true
  sftp_enabled              = true
  
  
  allow_nested_items_to_be_public   = false
  
  blob_properties {
    delete_retention_policy {
      days = 7
    }
  }

  network_rules {
    default_action = "Deny"

    bypass = [
      "AzureServices"
    ]

    ip_rules = local.ip_rules 
    
   virtual_network_subnet_ids = local.subnet_id 
    
  }

}


resource "azurerm_storage_container" "container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "private"
}



resource "azurerm_storage_share" "example" {
  name                 = var.file_share_name
  storage_account_name = azurerm_storage_account.example.name
  quota                = var.size_quota
  access_tier          = "Hot"
 


}

resource "azurerm_private_endpoint" "example" {

    
    resource_group_name           = var.resource_group_name
    location                      = var.location
    name                          = var.azure_private_endpoint_name
    subnet_id                     = var.private_endpoint_subnet	
  
    private_service_connection {
        is_manual_connection           = false
        name                           = var.azure_private_service_connection_name
        private_connection_resource_id = azurerm_storage_account.example.id
        subresource_names              = [
            "blob"
        ]        
        
    }
}

module "dns-multicloud" {
  source              = "git::https://github.com/lhaig/terraform-dns-multicloud.git?ref=v0.3.0"
  owner	              = var.owner
  namespace		         = var.namespace
  created-by		       = var.created-by
  aws_region	         = var.aws_region
  gcp_project	          = var.gcp_project
  gcp_region		        = var.gcp_region
  azure_location		    = var.azure_location
  create_gcp_dns_zone		= var.create_gcp_dns_zone
  create_aws_dns_zone		= var.create_aws_dns_zone
  hosted-zone	          = var.hosted-zone
}

output "aws_sub_zone_id" {
  value = var.create_aws_dns_zone ? aws_route53_zone.aws_sub_zone[0].zone_id : ""
}

output "aws_sub_zone_nameservers" {
  value = var.create_aws_dns_zone ? aws_route53_zone.aws_sub_zone[0].name_servers : []
}

output "azure_sub_zone_name" {
  value = var.create_azure_dns_zone ? azurerm_dns_zone.azure_sub_zone[0].id : ""
}

output "azure_sub_zone_nameservers" {
  value = var.create_azure_dns_zone ? azurerm_dns_zone.azure_sub_zone[0].name_servers : []
}

output "azure_dns_resourcegroup" {
  value = var.create_azure_dns_zone ? azurerm_resource_group.dns_resource_group[0].name : ""
}

output "gcp_dns_zone_name" {
  value = var.create_gcp_dns_zone ? google_dns_managed_zone.gcp_sub_zone[0].name : ""
}

output "gcp_dns_zone_nameservers" {
  value = var.create_gcp_dns_zone ? google_dns_managed_zone.gcp_sub_zone[0].name_servers : []
}

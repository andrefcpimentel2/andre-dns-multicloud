module "dns-multicloud" {
  source              = "git::https://github.com/lhaig/dns-multicloud.git?ref=v1.1"
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
  region	              = var.region
}

output "aws_sub_zone_id" {
  value = module.dns-multicloud.aws_sub_zone_id
}

output "aws_sub_zone_nameservers" {
  value = module.dns-multicloud.aws_sub_zone_nameservers
}

output "azure_sub_zone_name" {
  value = module.dns-multicloud.azure_sub_zone_name
}

output "azure_sub_zone_nameservers" {
  value = module.dns-multicloud.azure_sub_zone_nameservers
}

output "azure_dns_resourcegroup" {
  value = module.dns-multicloud.azure_dns_resourcegroup
}

output "gcp_dns_zone_name" {
  value = module.dns-multicloud.gcp_dns_zone_name
}

output "gcp_dns_zone_nameservers" {
  value = module.dns-multicloud.gcp_dns_zone_nameservers
}

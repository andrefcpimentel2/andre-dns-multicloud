module "dns-multicloud" {
  source              = "git::https://github.com/lhaig/terraform-dns-multicloud.git?ref=0.2.2"
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

 resource "null_resource" "test" {
   }
  
output "aws_sub_zone_id" {
  value = join("",module.dns-multicloud.aws_sub_zone_id)
}

output "aws_sub_zone_nameservers" {
  value = module.dns-multicloud.aws_sub_zone_nameservers
}

output "azure_sub_zone_name" {
  value = join("",module.dns-multicloud.azure_sub_zone_name)
}

output "azure_sub_zone_nameservers" {
  value = module.dns-multicloud.azure_sub_zone_nameservers
}

output "azure_dns_resourcegroup" {
  value = join("",module.dns-multicloud.azure_dns_resourcegroup)
}

output "gcp_dns_zone_name" {
  value = join("",module.dns-multicloud.gcp_dns_zone_name)
}

output "gcp_dns_zone_nameservers" {
  value = module.dns-multicloud.gcp_dns_zone_nameservers
}

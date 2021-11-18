output "private_subnet_tags" {
  description = "tags of private subnets that will be used to filter them while installing Vault"
  value       = var.private_subnet_tags
}

# output "public_subnet_tags" {
#   description = "tags of public subnets that will be used to filter them while installing Vault"
#   value       = var.public_subnet_tags
# }

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "hcp_vault_private_address" {
  value = hcp_vault_cluster.learn_hcp_vault.vault_private_endpoint_url
}


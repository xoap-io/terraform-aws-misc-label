# XOSS Terraform Labels Outputs
# ----------------------------------------------------------------------------------------------------------------------

output "id" {
  value       = local.id
  description = "Disambiguated ID"
}

output "product" {
  value       = local.product
  description = "Normalized name"
}


output "account" {
  value       = local.account
  description = "Normalized stage"
}

output "attributes" {
  value       = local.attributes
  description = "List of attributes"
}

output "delimiter" {
  value       = local.delimiter
  description = "Delimiter between `namespace`, `environment`, `stage`, `name` and `attributes`"
}

output "tags" {
  value       = local.tags
  description = "Normalized Tag map"
}

output "tags_as_list_of_maps" {
  value       = local.tags_as_list_of_maps
  description = "Additional tags as a list of maps, which can be used in several AWS resources"
}

output "context" {
  value       = local.output_context
  description = "Context of this module to pass to other label modules"
}

output "label_order" {
  value       = local.label_order
  description = "The naming order of the id output and Name tag"
}

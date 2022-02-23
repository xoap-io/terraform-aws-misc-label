locals {

  defaults = {
    label_order = ["product", "attributes", "account"]
    delimiter   = "-"
    replacement = ""
    sentinel    = "~"
    attributes  = [""]
  }

  product     = lower(var.context.product)
  account     = lower(var.context.account)
  delimiter   = coalesce(local.defaults.delimiter)
  label_order = local.defaults.label_order

  # Merge attributes
  attributes = compact(distinct(concat(var.attributes, local.defaults.attributes)))

  tags = merge(var.context.tags, local.generated_tags)

  tags_as_list_of_maps = flatten([
    for key in keys(local.tags) : merge(
      {
        key   = key
        value = local.tags[key]
    })
  ])

  tags_context = {
    # For AWS we need `Name` to be disambiguated since it has a special meaning
    product      = local.id
    organization = var.context.organization
    environment  = var.context.environment
    account      = local.account
    attributes   = local.id_context.attributes
  }

  generated_tags = { for l in keys(local.tags_context) : title(l) => local.tags_context[l] if length(local.tags_context[l]) > 0 }

  id_context = {
    product    = local.product
    account    = local.account
    attributes = lower(join(local.delimiter, local.attributes))
  }

  labels = [for l in local.label_order : local.id_context[l] if length(local.id_context[l]) > 0]

  id = lower(join(local.delimiter, local.labels))

  # Context of this label to pass to other label modules
  output_context = {
    product     = local.product
    account     = local.account
    attributes  = local.attributes
    tags        = local.tags
    delimiter   = local.delimiter
    label_order = local.label_order
  }

}

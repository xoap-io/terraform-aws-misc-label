# XOSS Organizations Terraform Lables Variables
# ----------------------------------------------------------------------------------------------------------------------

variable "attributes" {
  type        = list(string)
  default     = []
  description = "Additional attributes (e.g. `public`)"
}

variable "context" {
  type = object({
    organization = string
    environment  = string
    account      = string
    product      = string
    tags         = map(string)
  })
  description = "Default environmental context"
}

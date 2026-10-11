variable "users" {
  description = <<EOT
Map of users, attributes below
Required:
    - realm_id
    - username
Optional:
    - attributes
    - email
    - email_verified
    - enabled
    - first_name
    - import
    - last_name
    - required_actions
    - federated_identity (block):
        - identity_provider (required)
        - user_id (required)
        - user_name (required)
    - initial_password (block):
        - temporary (optional)
        - value (optional)
        - value_wo (optional)
        - value_wo_version (optional)
EOT

  type = map(object({
    realm_id         = string
    username         = string
    attributes       = optional(map(string))
    email            = optional(string)
    email_verified   = optional(bool)
    enabled          = optional(bool)
    first_name       = optional(string)
    import           = optional(bool)
    last_name        = optional(string)
    required_actions = optional(set(string))
    federated_identity = optional(list(object({
      identity_provider = string
      user_id           = string
      user_name         = string
    })))
    initial_password = optional(object({
      temporary        = optional(bool)
      value            = optional(string)
      value_wo         = optional(string)
      value_wo_version = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.users : (
        v.initial_password == null || (v.initial_password.value_wo == null || (length(v.initial_password.value_wo) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.users : (
        v.initial_password == null || (v.initial_password.value_wo_version == null || (length(v.initial_password.value_wo_version) > 0))
      )
    ])
    error_message = "must not be empty"
  }
}


resource "keycloak_user" "users" {
  for_each = var.users

  realm_id         = each.value.realm_id
  username         = each.value.username
  attributes       = each.value.attributes
  email            = each.value.email
  email_verified   = each.value.email_verified
  enabled          = each.value.enabled
  first_name       = each.value.first_name
  import           = each.value.import
  last_name        = each.value.last_name
  required_actions = each.value.required_actions

  dynamic "federated_identity" {
    for_each = each.value.federated_identity != null ? each.value.federated_identity : []
    content {
      identity_provider = federated_identity.value.identity_provider
      user_id           = federated_identity.value.user_id
      user_name         = federated_identity.value.user_name
    }
  }

  dynamic "initial_password" {
    for_each = each.value.initial_password != null ? [each.value.initial_password] : []
    content {
      temporary        = initial_password.value.temporary
      value            = initial_password.value.value
      value_wo         = initial_password.value.value_wo
      value_wo_version = initial_password.value.value_wo_version
    }
  }
}


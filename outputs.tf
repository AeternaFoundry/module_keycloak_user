output "users_id" {
  description = "Map of id values across all users, keyed the same as var.users"
  value       = { for k, v in keycloak_user.users : k => v.id }
}
output "users_attributes" {
  description = "Map of attributes values across all users, keyed the same as var.users"
  value       = { for k, v in keycloak_user.users : k => v.attributes }
}
output "users_email" {
  description = "Map of email values across all users, keyed the same as var.users"
  value       = { for k, v in keycloak_user.users : k => v.email }
}
output "users_email_verified" {
  description = "Map of email_verified values across all users, keyed the same as var.users"
  value       = { for k, v in keycloak_user.users : k => v.email_verified }
}
output "users_enabled" {
  description = "Map of enabled values across all users, keyed the same as var.users"
  value       = { for k, v in keycloak_user.users : k => v.enabled }
}
output "users_federated_identity" {
  description = "Map of federated_identity values across all users, keyed the same as var.users"
  value       = { for k, v in keycloak_user.users : k => v.federated_identity }
}
output "users_first_name" {
  description = "Map of first_name values across all users, keyed the same as var.users"
  value       = { for k, v in keycloak_user.users : k => v.first_name }
}
output "users_import" {
  description = "Map of import values across all users, keyed the same as var.users"
  value       = { for k, v in keycloak_user.users : k => v.import }
}
output "users_initial_password" {
  description = "Map of initial_password values across all users, keyed the same as var.users"
  value       = { for k, v in keycloak_user.users : k => one(v.initial_password) }
  sensitive   = true
}
output "users_last_name" {
  description = "Map of last_name values across all users, keyed the same as var.users"
  value       = { for k, v in keycloak_user.users : k => v.last_name }
}
output "users_realm_id" {
  description = "Map of realm_id values across all users, keyed the same as var.users"
  value       = { for k, v in keycloak_user.users : k => v.realm_id }
}
output "users_required_actions" {
  description = "Map of required_actions values across all users, keyed the same as var.users"
  value       = { for k, v in keycloak_user.users : k => v.required_actions }
}
output "users_username" {
  description = "Map of username values across all users, keyed the same as var.users"
  value       = { for k, v in keycloak_user.users : k => v.username }
}


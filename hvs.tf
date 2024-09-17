resource "hcp_vault_secrets_app" "hvs_app" {
  app_name    = var.waypoint_application
  description = "HCP Vault Secrets for Waypoint application ${var.waypoint_application}"
}
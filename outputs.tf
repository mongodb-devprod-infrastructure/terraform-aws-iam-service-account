output "service_account_name" {
  description = "The name of the service account"
  value       = kubernetes_service_account.this.metadata[0].name
}

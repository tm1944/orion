output "cluster_name" {
  description = "Kind cluster name."
  value       = kind_cluster.this.name
}

output "kubeconfig_path" {
  description = "Absolute path to the kubeconfig file on disk."
  value       = kind_cluster.this.kubeconfig_path
}

output "kubeconfig" {
  description = "Raw kubeconfig content (use sparingly; prefer kubeconfig_path)."
  value       = kind_cluster.this.kubeconfig
  sensitive   = true
}

output "endpoint" {
  description = "Kubernetes API server endpoint."
  value       = kind_cluster.this.endpoint
}

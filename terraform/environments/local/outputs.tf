output "cluster_name" {
  description = "Provisioned Kind cluster name."
  value       = module.kind_cluster.cluster_name
}

output "kubeconfig_path" {
  description = "Path to kubeconfig — export as KUBECONFIG in bootstrap scripts."
  value       = module.kind_cluster.kubeconfig_path
}

output "endpoint" {
  description = "Kubernetes API server URL."
  value       = module.kind_cluster.endpoint
}

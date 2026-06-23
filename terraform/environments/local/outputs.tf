output "local_cluster_name" {
    value = module.local_k8s.cluster_name
}

output "local_kubeconfig_path" {
    value = module.local_k8s.kubeconfig_path
}

output "local_endpoint" {
    value = module.local_k8s.endpoint
}
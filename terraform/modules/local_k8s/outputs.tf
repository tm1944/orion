output "cluster_name" {
    value = kind_cluster.cluster.name
    description = "Kind Cluster Identifier"
}

output "kubeconfig_path"{
    value = kind_cluster.cluster.kubeconfig_path
    description = "Path on disk for KUBECONFIG"
}

output "endpoint" {
    value = kind_cluster.cluster.endpoint
    description = "K8s API server URL"
}
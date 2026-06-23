module "local_k8s" {
    source = "../../modules/local_k8s"
    cluster_name = var.cluster_name
    worker_nodes = var.worker_nodes
    kubeconfig_path = var.kubeconfig_path
    ingress_host_port = var.ingress_host_port
    node_image = var.node_image
}
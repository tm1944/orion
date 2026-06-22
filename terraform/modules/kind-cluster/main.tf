resource "kind_cluster" "cluster" {
    name = var.cluster_name
    wait_for_ready = true
    kubeconfig_path = pathexpand(var.kubeconfig_path)
    node_image = var.node_image

    kind_config {
      kind = "Cluster"
      api_version = "kind.x-k8s.io/v1alpha4"

      node {
        role = "control-plane"
        kubeadm_config_patches = [
            "kind: InitConfiguration\nnodeRegistration:\n  kubeletExtraArgs:\n    node-labels: \"ingress-ready=true\"\n"
        ]
        extra_port_mappings {
          container_port = 80
          host_port = var.ingress_host_port
        }
      }
      dynamic "node" {
        for_each = range(var.worker_nodes)
        content {
            role = "worker"
            }
        }
    }
}
terraform {
  required_providers {
    kind = {
      source  = "tehcyx/kind"
      version = "~> 0.8"
    }
  }
}

resource "kind_cluster" "this" {
  name            = var.cluster_name
  node_image      = var.node_image
  kubeconfig_path = pathexpand(var.kubeconfig_path)
  wait_for_ready  = true

  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    node {
      role = "control-plane"

      # Labels the node so an ingress controller can target it in Sprint 2.
      kubeadm_config_patches = [
        <<-EOT
        kind: InitConfiguration
        nodeRegistration:
          kubeletExtraArgs:
            node-labels: "ingress-ready=true"
        EOT
      ]

      extra_port_mappings {
        container_port = 80
        host_port      = var.ingress_host_port
        protocol       = "TCP"
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

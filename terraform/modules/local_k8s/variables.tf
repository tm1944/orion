variable "cluster_name" {
    type = string
    description = "Kind cluster name"
}

variable "worker_nodes" {
    type = number
    description = "count of worker nodes (>=1)"
    validation {
      condition = var.worker_nodes >= 1
      error_message = "You have to have atleast 1 worker node"
    }
}

variable "kubeconfig_path" {
    type = string
    description = "Where to write kubeconfig"
}

variable "ingress_host_port" {
    type = number
    description = "Host port -> container 80 on control-plane"
    validation {
      condition = var.ingress_host_port > 0 && var.ingress_host_port < 65536
      error_message = "ingress_host_port has to be a valid TCP port!"
    }
}

variable "node_image" {
    type = string
    description = "e.g kindest/node:v1.31.0"
}
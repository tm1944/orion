variable "cluster_name" {
  description = "Name of the Kind cluster (must be unique on this machine)."
  type        = string
}

variable "worker_nodes" {
  description = "Number of worker nodes (control-plane is always 1)."
  type        = number

  validation {
    condition     = var.worker_nodes >= 1
    error_message = "worker_nodes must be at least 1 so we can schedule pods across multiple nodes later."
  }
}

variable "kubeconfig_path" {
  description = "Filesystem path where Kind writes the kubeconfig file."
  type        = string
}

variable "ingress_host_port" {
  description = "Host port mapped to port 80 on the control-plane node (for future ingress)."
  type        = number

  validation {
    condition     = var.ingress_host_port > 0 && var.ingress_host_port < 65536
    error_message = "ingress_host_port must be a valid TCP port (1-65535)."
  }
}

variable "node_image" {
  description = "KinD node image (pins Kubernetes version). Example: kindest/node:v1.31.0"
  type        = string
}

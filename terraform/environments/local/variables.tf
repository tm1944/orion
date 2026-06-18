variable "cluster_name" {
  description = "Name of the Kind cluster."
  type        = string
}

variable "worker_nodes" {
  description = "Number of worker nodes."
  type        = number
}

variable "kubeconfig_path" {
  description = "Where to write the kubeconfig file."
  type        = string
}

variable "ingress_host_port" {
  description = "Host port for ingress traffic (mapped to container port 80)."
  type        = number
}

variable "node_image" {
  description = "KinD node Docker image tag."
  type        = string
}

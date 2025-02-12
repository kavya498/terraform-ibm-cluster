########################################################
# Classic kubernetes cluster worker pool configuration
# Copyright 2020 IBM
########################################################

variable "cluster_name" {
  description = "Name of the cluster"
  type        = string
}
variable "flavor" {
  description = "Machine type."
  type        = string
}

variable "worker_pool_name" {
  description = "Name of the worker pool."
  type        = string
}

variable "worker_nodes" {
  description = "Number of worker nodes"
  type        = number
}

variable "hardware" {
  description = "The level of hardware isolation for your worker node."
  type        = string
  default     = "shared"
}


variable "encrypt_local_disk" {
  description = "Set this to true to enable disk encryption"
  type        = bool
  default     = true
}

variable "worker_zones" {
  type    = map
  default = {}
}

variable "labels" {
  type    = map
  default = {}
}

variable "resource_group_id" {
  description = "Resource group ID"
  type        = string
  default     = null
}

variable "wait_till_albs" {
  description = "specify the stage when you want Terraform to mark the zone attachment complete."
  type        = bool
  default     = false
}



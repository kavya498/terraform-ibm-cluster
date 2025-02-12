#####################################################
# classic kubernetes single-zone cluster provisioning
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

data "ibm_resource_group" "test" {
  name = var.resource_group
}

module "classic_kubernetes_single_zone_cluster" {
  source = "terraform-ibm-modules/cluster/ibm//modules/classic-kubernetes-single-zone"

  cluster_name                    = var.cluster_name
  worker_zone                     = var.worker_zone
  hardware                        = var.hardware
  resource_group_id               = data.ibm_resource_group.test.id
  worker_nodes_per_zone           = var.worker_nodes_per_zone
  worker_pool_flavor              = var.worker_pool_flavor
  public_vlan                     = var.public_vlan_id
  private_vlan                    = var.private_vlan_id
  master_service_public_endpoint  = var.master_service_public_endpoint
  master_service_private_endpoint = var.master_service_private_endpoint
  force_delete_storage            = var.force_delete_storage
  gateway_enabled                 = var.gateway_enabled
  encrypt_local_disk              = var.encrypt_local_disk
  no_subnet                       = var.no_subnet
  subnet_id                       = var.subnet_id
  update_all_workers              = var.update_all_workers
  tags                            = var.tags
  kube_version                    = var.kube_version
  kms_config                      = var.kms_config
  workers_info                    = var.workers_info
  webhook                         = var.webhook

}
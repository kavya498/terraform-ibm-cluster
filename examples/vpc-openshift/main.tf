#####################################################
# vpc openshift cluster provisioning
# Copyright 2020 IBM
#####################################################

data "ibm_resource_group" "test" {
  name = var.resource_group
}

module "vpc_openshift_cluster" {
  source = "terraform-ibm-modules/cluster/ibm//modules/vpc-openshift"

  cluster_name                    = var.cluster_name
  vpc_id                          = var.vpc_id
  worker_pool_flavor              = var.worker_pool_flavor
  worker_zones                    = var.worker_zones
  worker_nodes_per_zone           = var.worker_nodes_per_zone
  resource_group_id               = data.ibm_resource_group.test.id
  kube_version                    = var.kube_version
  update_all_workers              = var.update_all_workers
  service_subnet                  = var.service_subnet
  pod_subnet                      = var.pod_subnet
  worker_labels                   = var.worker_labels
  wait_till                       = var.wait_till
  disable_public_service_endpoint = var.disable_public_service_endpoint
  tags                            = var.tags
  cos_instance_crn                = var.cos_instance_crn
  force_delete_storage            = var.force_delete_storage
  kms_config                      = var.kms_config
  entitlement                     = var.entitlement
}
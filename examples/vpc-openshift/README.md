# Module vpc-openshift-cluster

This module is used to to provision an vpc openshift cluster on IBM Cloud Infrastructure - VPC.

## Example Usage
```

data "ibm_resource_group" "test" {
  name = var.resource_group
}

module "vpc_openshift_cluster" {
  source  = "terraform-ibm-modules/cluster/ibm//modules/vpc-openshift"

  cluster_name                    = var.cluster_name
  vpc_id                          = var.vpc_id
  worker_pool_flavor              = var.worker_pool_flavor
  worker_zones                    = var.worker_zones
  worker_nodes_per_zone           = (var.worker_nodes_per_zone != null ? var.worker_nodes_per_zone : 1)
  resource_group_id               = data.ibm_resource_group.test.id
  kube_version                    = (var.kube_version != null ? var.kube_version : null)
  update_all_workers              = (var.update_all_workers != null ? var.update_all_workers : false)
  service_subnet                  = (var.service_subnet != null ?  var.service_subnet : "172.21.0.0/16")
  pod_subnet                      = (var.pod_subnet != null ? var.pod_subnet : "172.30.0.0/16")
  worker_labels                   = (var.worker_labels != null ? var.worker_labels : null)
  wait_till                       = (var.wait_till != null ? var.wait_till  : "ingressReady")
  disable_public_service_endpoint = (var.disable_public_service_endpoint != null ? var.disable_public_service_endpoint : true)
  tags                            = (var.tags != null ? var.tags : [])
  cos_instance_crn                = (var.cos_instance_crn != null ? var.cos_instance_crn : null)
  force_delete_storage            = (var.force_delete_storage != null ? var.force_delete_storage : false)
  kms_config                      = (var.kms_config != null ? var.kms_config : [])
  entitlement                     = (var.entitlement != null ? var.entitlement : null)
}
```
## NOTE:

If we want to make use of a particular version of module, then set the "version" argument to respective module version.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name                              | Description                                             | Type   | Default     | Required |
|-----------------------------------|---------------------------------------------------------|--------|-------------|----------|
| cluster\_name                     | Name of the cluster                                     | string | n/a         | yes      |
| vpc\_id                           | The ID of the VPC.                                      | string | n/a         | yes      |
| worker\_pool\_flavor              | The flavor of the VPC worker node that you want to use. | string | n/a         | yes      |
| worker\_zones                     | Map(Map(zones)) where each zone has its subnet id       | map    | n/a         | yes      |
| resource_group                    | Name of the resource group.                             | string | n/a         | no       |
| worker\_nodes\_per\_zone          | Number of worker nodes.                                 | number | 1           | no       |
| kube\_version                     | Kubernetes version                                      | string | n/a         | no       |
| update\_all\_workers              | Kubernetes version of the worker nodes is updated       | bool   | false       | no       |
| service\_subnet                   | Custom subnet CIDR to provide private IP for services   | string | n/a         | no       |
| pod\_subnet                       | Custom subnet CIDR to provide private IP  for pods      | string | n/a         | no       |
| worker\_labels                    | Labels on all the workers in the default worker pool    | map    | n/a         | no       |
| wait\_till                        | Stage when to mark the cluster creation as completed    | string | ingressReady| no       |
| cos\_instance\_crn                | CRN of cos instance                                     | string | n/a         | no       |
| kms\_config                       | Use to attach a Key Protect instance to a cluster.      | list   | n/a         | no       |
| tags                              | List of tags to attach                                  | list   | n/a         | no       |
| force\_delete\_storage            | Set to delete persistent storage of cluster             | bool   | false       | no       |
| entitlement                       | OpenShift entitlement avoids the OCP licence charges    | string | n/a     | no       |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## worker_zones Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| subnet_id                         | Uniue identifier of subnet                            | string | n/a     | no       |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## kms_config Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
|  instance_id                      | GUID of the Key Protect instance.                     | string | n/a     | no       |
|  crk_id                           | ID of the customer root key.                          | string | n/a     | no       |
|  private_endpoint                 | Set to true to configure KMS private service endpoint.| bool   | n/a     | no       |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Note

All optional fields are given value `null` in varaible.tf file. User can configure the same by overwriting with appropriate values.

Worker zones is a map(map(zones)), where key will be zone_name and value will be map containing respective subnet_id.

## Usage

terraform apply -var-file="input.tfvars"
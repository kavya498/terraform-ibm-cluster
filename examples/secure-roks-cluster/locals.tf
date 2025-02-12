locals {
  zones = [for index in range(3) : "${var.ibm_region}-${index + 1}"]
  worker_zones = {
    element(local.zones, 0) = {
      subnet_id = module.subnet[local.zones[0]].subnet_id
    }
  }
  pool_worker_zones = {
    for zone in slice(local.zones, 1, 3) :
    zone => {
      subnet_id = module.subnet[zone].subnet_id
    }
  }
  kms_config = var.kms_instance != null && var.kms_key != null ? [{
    instance_id      = data.ibm_resource_instance.kms_instance[0].guid
    crk_id           = data.ibm_kms_key.kms_key[0].keys[0].id
    private_endpoint = true
  }] : []
  timeouts = [{
    create = var.create_timeout
  }]
  sg_rules = [
    {
      name       = "${var.resource_prefix}-sg-rule-1"
      direction  = "inbound"
      remote     = ""
      ip_version = ""
      tcp = {
        port_min = 30000
        port_max = 32767
      }
      icmp = null
      udp  = null
    },
    {
      name       = "${var.resource_prefix}-sg-rule-2"
      direction  = "inbound"
      remote     = ""
      ip_version = ""
      tcp        = null
      udp = {
        port_min = 30000
        port_max = 32767
      }
      icmp = null
    },
    {
      name       = "${var.resource_prefix}-sg-rule-3"
      direction  = "inbound"
      remote     = ""
      ip_version = ""
      tcp        = null
      udp        = null
      icmp = {
        type = 8
        code = null
      }
    }
  ]
} 
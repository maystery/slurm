# Telling terraform which provider to download from the Terraform Registry
terraform {
  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
    version = "1.44.0" }
  }
}

# Configure the OpenStack Provider, the cloud itself where it will be provisioned
provider "openstack" {
  tenant_name = var.tenant_name
  auth_url    = var.auth_url
  application_credential_id = var.application_credential_id
  application_credential_secret = var.application_credential_secret
}

# resource specific configuration
resource "openstack_compute_instance_v2" "slurm-master" {
  name            = "slurm-master"
  image_id        = var.master_image_id
  flavor_id       = var.master_flavor_id
  key_pair        = var.master_key_pair
  security_groups = var.master_security_groups

  user_data = file("scripts/cloud_init_master.yaml")

  network {
    name = var.master_network_name
  }
}

# resource specific configuration
resource "openstack_compute_instance_v2" "slurm-worker" {
  count           = 2
  name            = "slurm-worker-${count.index + 1}"
  image_id        = var.worker_image_id
  flavor_id       = var.worker_flavor_id
  key_pair        = var.worker_key_pair
  security_groups = var.worker_security_groups

  user_data = templatefile("scripts/cloud_init_worker.yaml", {
    master_ip       = openstack_compute_instance_v2.slurm-master.network[0].fixed_ip_v4,
  })

  network {
    name = var.worker_network_name
  }
}


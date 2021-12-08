# Telling terraform which provider to download from the Terraform Registry
terraform {
  required_providers {
    openstack   = {
      source    = "terraform-provider-openstack/openstack"
    version     = "1.44.0" }
  }
}

# Configure the OpenStack Provider, the cloud itself where it will be provisioned
provider "openstack" {
  auth_url                      = var.auth_url
  application_credential_id     = var.application_credential_id
  application_credential_secret = var.application_credential_secret
  tenant_id                     = var.tenant_id
}

# resource specific configuration
resource "openstack_compute_instance_v2" "slurm-master" {
  name            = "slurm-master"
  flavor_name     = var.master_flavor_name
  key_pair        = var.master_key_pair
  security_groups = var.master_security_groups

  user_data = file("scripts/cloud_init_master.yaml")

  block_device {
    uuid                  = var.master_image_id
    source_type           = "image"
    destination_type      = "volume"
    boot_index            = 0
    delete_on_termination = true
    volume_size           = var.volume_os_size
  }

  network {
    name = var.master_network_name
  }
}

# resource specific configuration
resource "openstack_compute_instance_v2" "slurm-worker" {
  count           = var.worker_count
  name            = "slurm-worker-cpu-compute-${element(random_pet.slurm_name.*.id, count.index)}"
  flavor_name     = var.worker_flavor_name
  key_pair        = var.worker_key_pair
  security_groups = var.worker_security_groups

  user_data = templatefile("scripts/cloud_init_worker.yaml", {
    master_ip       = openstack_compute_instance_v2.slurm-master.network[0].fixed_ip_v4,
  })

  block_device {
    uuid                  = var.worker_image_id
    source_type           = "image"
    destination_type      = "volume"
    boot_index            = 0
    delete_on_termination = true
    volume_size           = var.volume_os_size
  }

  network {
    name = var.worker_network_name
  }
}

resource "random_pet" "slurm_name" {
  count = var.worker_count
}

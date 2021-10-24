# cloud
variable "application_credential_id" {}
variable "application_credential_secret" {}
variable "auth_url" {}
variable "tenant_id" {}

# master
variable "master_image_id" {}
variable "master_flavor_name" {}
variable "master_key_pair" {}
variable "master_security_groups" {
  type = list(string)
}
variable "master_network_name" {}

# worker
variable "worker_image_id" {}
variable "worker_flavor_name" {}
variable "worker_key_pair" {}
variable "worker_security_groups" {
  type = list(string)
}
variable "worker_network_name" {}
variable "volume_os_size" {}
variable "worker_count" {}
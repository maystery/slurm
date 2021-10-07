# cloud
variable "application_credential_id" {}
variable "tenant_name" {}
variable "application_credential_secret" {}
variable "auth_url" {}

# master
variable "master_image_id" {}
variable "master_flavor_id" {}
variable "master_key_pair" {}
variable "master_security_groups" {
  type = list(string)
}
variable "master_network_name" {}

# worker
variable "worker_image_id" {}
variable "worker_flavor_id" {}
variable "worker_key_pair" {}
variable "worker_security_groups" {
  type = list(string)
}
variable "worker_network_name" {}

# application
variable "munge_version" {
  type        = string
  description = "Munge version"
}
variable "slurm_version" {
  type        = string
  description = "Slurm version"
}
# cloud
tenant_name = "lpds"
auth_url = "https://cloud.hbit.sztaki.hu:5000/v3"


# master
master_image_id = "72d56cf7-04da-4532-bf27-9047cdbee3f5"
master_flavor_id = "cf0f1cb2-43f5-4d36-99d0-8ca2e4380517"
master_key_pair = "emodi"
master_security_groups = ["local-all","ssh", "default"]
master_network_name = "lpds_net"

# worker
worker_image_id = "72d56cf7-04da-4532-bf27-9047cdbee3f5"
worker_flavor_id = "cf0f1cb2-43f5-4d36-99d0-8ca2e4380517"
worker_key_pair = "emodi"
worker_security_groups = ["all-open"]
worker_network_name = "lpds_net"

# application
munge_version = "0.5.13-2build1"
slurm_version = "19.05.5-1"

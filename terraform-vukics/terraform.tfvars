# cloud
tenant_id                  = "6d11cf70249747a393dbf3184e50980a"
auth_url                   = "https://sztaki.science-cloud.hu:5000"


# master
master_image_id            = "8b693880-6273-44b0-91ab-f0e9403dff69"
master_flavor_name         = "m2.medium"
master_key_pair            = "emodi"
master_security_groups     = ["local-all","ssh", "default"]
master_network_name        = "default"

# worker
worker_image_id            = "8b693880-6273-44b0-91ab-f0e9403dff69"
worker_flavor_name         = "m2.medium"
worker_key_pair            = "emodi"
worker_security_groups     = ["local-all"]
worker_network_name        = "default"
volume_os_size             = 20
worker_count               = 5
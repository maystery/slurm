#!/bin/bash

docker exec -it occopus occopus-import /opt/slurm-cluster/slurm-cluster/nodes/node_definitions.yaml
docker exec -it occopus occopus-build --auth_data_path /opt/auth_data.yaml --parallelize /opt/slurm-cluster/slurm-cluster/infra-slurm-cluster.yaml

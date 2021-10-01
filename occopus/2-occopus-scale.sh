#!/bin/bash

docker exec -it occopus occopus-scale -n slurm-worker -c $1 -i $2
docker exec -it occopus occopus-maintain --auth_data_path /opt/auth_data.yaml --parallelize -i $2

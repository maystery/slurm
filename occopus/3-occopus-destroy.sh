#!/bin/bash

docker exec -it occopus occopus-destroy --auth_data_path /opt/auth_data.yaml -i $1

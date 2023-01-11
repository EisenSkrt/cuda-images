#!/bin/bash

set -e

export VERSION=$1
export UBUNTU=$2

docker compose build

echo y | docker system prune

cat ./image_list.txt | envsubst | xargs -n1 docker push


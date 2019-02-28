#!/bin/sh
set -e
cd `dirname $0`

export VERSION=${1:-0.1-dev}

if [ -z "${VERSION##*-*}" ]; then
  export DOCKER_REGISTRY="docker-ci.axoom.cloud"
else
  export DOCKER_REGISTRY="docker.axoom.cloud"
fi

docker-compose -f docker-compose.yml build
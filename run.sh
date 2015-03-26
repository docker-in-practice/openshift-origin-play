#!/bin/bash
set -e
NAME=openshift-origin
docker pull imiell/openshift-origin
mkdir -p /tmp/openshift
echo "================================================"
echo "Trying to remove any existing container running"
echo "================================================"
docker rm -f $NAME || /bin/true
docker run -d -v /tmp/openshift:/tmp/openshift --name $NAME --net=host --privileged -v /var/run/docker.sock:/var/run/docker.sock imiell/openshift-origin start
echo "================================================"
echo "You are now in the origin server container"
echo "================================================"
docker exec -ti $NAME bash


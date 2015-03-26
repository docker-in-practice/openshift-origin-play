#!/bin/bash
set -e
NAME=openshift-origin
docker pull dockerinpractice/openshift-origin-play
mkdir -p /tmp/openshift
echo "================================================"
echo "Trying to remove any existing container running"
echo "================================================"
docker rm -f $NAME || /bin/true
docker run -d --name $NAME --net=host --privileged -v /var/run/docker.sock:/var/run/docker.sock dockerinpractice/openshift-origin-play start
echo "================================================"
echo "You are now in the origin server container"
echo "================================================"
docker exec -ti $NAME bash


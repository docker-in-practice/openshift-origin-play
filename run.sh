#!/bin/bash
docker pull imiell/openshift-origin
mkdir -p /tmp/openshift
docker run -d -v /tmp/openshift:/tmp/openshift --name openshift-origin --net=host --privileged -v /var/run/docker.sock:/var/run/docker.sock openshift/origin start
docker exec -ti openshift-origin bash


#!/bin/bash
DOCKER_GROUP=$(grep 'docker' /etc/group | awk -F':' '{print $3}')
if [[ -z "$DOCKER_GROUP" ]]; then
  echo docker not found in /etc/group > /dev/stderr
  exit 1
fi

docker run -d -p 8080:8080 \
       -p 5000:5000 \
       -v jenkins:/var/jenkins_home \
       -v /var/run/docker.sock:/var/run/docker.sock \
       --restart always \
       --name jenkinsdock \
       --group-add $DOCKER_GROUP \
      jenkinsdock

#!/bin/bash
docker run -d -p 8080:8080 \
       -p 5000:5000 \
       -v jenkins:/var/jenkins_home \
       -v /var/run/docker.sock:/var/run/docker.sock \
       --name jenkinsdock \
       --restart always \
       --group-add staff jenkinsdock

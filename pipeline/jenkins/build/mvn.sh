#!/bin/bash

echo "********************************"
echo "*** building jar ***************"
echo "********************************"


WORKSPACE=/home/azureuser/jenkins-data/jenkins_home/workspace/pipeline-docker-maven/pipeline

docker run -v $WORKSPACE/java-app:/app -v /root/.m2/:/root/.m2/ -w /app maven:3-alpine "$@"

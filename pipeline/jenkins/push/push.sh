#!/bin/bash

echo "********************"
echo "** Pushing image ***"
echo "********************"

IMAGE="nk-maven-jenkins"
USER_NAME="ninadkanthi"

echo "** Logging in ***"
docker login -u $USER_NAME -p $PASS
echo "*** Tagging image ***"
docker tag $IMAGE:$BUILD_TAG $USER_NAME/$IMAGE:$BUILD_TAG
echo "*** Pushing image ***"
docker push $USER_NAME/$IMAGE:$BUILD_TAG

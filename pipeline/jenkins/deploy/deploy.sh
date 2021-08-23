#!/bin/bash

echo nk-maven-jenkins > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth
PRIVATE_KEY=/opt/ninadk-jenkins-centos_key.pem
REMOTE_MACHINE=azureuser@ninadk-jenkins-centos.westindia.cloudapp.azure.com


scp -i $PRIVATE_KEY /tmp/.auth $REMOTE_MACHINE:/tmp/.auth
scp -i $PRIVATE_KEY ./jenkins/deploy/publish $REMOTE_MACHINE:/tmp/publish
ssh -i $PRIVATE_KEY  $REMOTE_MACHINE "/tmp/publish"

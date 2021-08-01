#!/bin/sh
DATE=$(date +%d-%m-%y-%H-%M-%S)
DB_HOST=$1
DB_PASSWORD=$2
DB_NAME=$3
BUCKET_NAME=$4
# Pay special attention to the fact that there is no space when specifying password. 
mysqldump -u root -h $DB_HOST -p$DB_PASSWORD $DB_NAME > /tmp/db-$DATE.sql && \
/usr/local/gcloud/google-cloud-sdk/bin/gsutil cp /tmp/db-$DATE.sql gs://$BUCKET_NAME

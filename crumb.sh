JENKINS_URL='http://ninadk-jenkins.westindia.cloudapp.azure.com:8080'
JENKINS_USER='jenkins:1234'
CRUMB_TXT='/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)'
crumb=$(curl -u $JENKINS_USER -s $JENKINS_URL$CRUMB_TXT)
echo $crumb
# crumbURL="$jenkinsURL/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)"
# echo $crumbURL
# crumb=$(curl -u "jenkins:1234" -s "$crumbURL")
# echo $crumb
curl -u "$JENKINS_USER" -H "$crumb" -X POST  "$JENKINS_URL/job/ENV/build?delay=0sec"
curl -u "$JENKINS_USER" -H "$crumb" -X POST  "$JENKINS_URL/job/backup-to-gcp/buildWithParameters?DB_HOST=db_host&DB_NAME=testdb&BUCKET_NAME=jenkins-mysql-backup-ninadk"

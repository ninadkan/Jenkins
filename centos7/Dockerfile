FROM centos:7
  
RUN yum -y install openssh-server

RUN useradd remote_user && \
    echo "1234" | passwd remote_user  --stdin && \
    mkdir /home/remote_user/.ssh && \
    chmod 700 /home/remote_user/.ssh

COPY remote-key.pub /home/remote_user/.ssh/authorized_keys

RUN chown remote_user:remote_user   -R /home/remote_user && \
    chmod 400 /home/remote_user/.ssh/authorized_keys

RUN ssh-keygen -A

RUN yum -y install mysql

RUN curl -O https://bootstrap.pypa.io/pip/2.7/get-pip.py && \
    python get-pip.py


#RUN yum -y install epel-release && \
#     yum -y install python3-pip && \
#     pip3 install --upgrade pip


# Downloading gcloud package
RUN curl https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz > /tmp/google-cloud-sdk.tar.gz

# create folder for installing the GCP package
RUN mkdir -p /usr/local/gcloud

# Give the permissiong to remote_user
RUN chown remote_user:remote_user   -R /usr/local/gcloud
# copy the service account credentials files to copy everything across #
COPY mysqlbackup.gcloud.json /home/remote_user/mysqlbackup.gcloud.json

# ensure that it has proper access 
RUN chown remote_user:remote_user /home/remote_user/mysqlbackup.gcloud.json

# start and install the gcloud with remote_user priviledges
USER remote_user
RUN  tar -C /usr/local/gcloud -xvf /tmp/google-cloud-sdk.tar.gz \
   && /usr/local/gcloud/google-cloud-sdk/install.sh


# Adding the package path to local
ENV PATH "$PATH:/usr/local/gcloud/google-cloud-sdk/bin"

# Not recommended but updating the .bashrc to ensure that everyone can see the gcloud SDK
# RUN touch /root/.bashrc \
#  && cat /usr/local/gcloud/google-cloud-sdk/path.bash.inc >> /root/.bashrc

RUN touch /home/remote_user/.bashrc \
 && cat /usr/local/gcloud/google-cloud-sdk/path.bash.inc >> /home/remote_user/.bashrc


# set the appropriate environment for everything to work ok
ENV GOOGLE_CREDENTIALS_FILE /home/remote_user/mysqlbackup.gcloud.json
ENV GOOGLE_PROJECT fleet-pillar-272913
RUN gcloud auth activate-service-account jenkins-mysql-backup-operator@fleet-pillar-272913.iam.gserviceaccount.com --key-file=/home/remote_user/mysqlbackup.gcloud.json
RUN gcloud config set project fleet-pillar-272913
RUN gcloud config set account jenkins-mysql-backup-operator@fleet-pillar-272913.iam.gserviceaccount.com
RUN gcloud auth list
# gcloud projects list # list number of projects accessible to current account
RUN gcloud config set pass_credentials_to_gsutil true

USER root
CMD /usr/sbin/sshd -D

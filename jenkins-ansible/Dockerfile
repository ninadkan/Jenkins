FROM jenkins/jenkins
  
USER root

#RUN curl -O https://bootstrap.pypa.io/pip/2.7/get-pip.py && \
#    python get-pip.py && \
#    pip install ansible --upgrade 

RUN apt-get update && apt-get install python3-pip -y && \
    pip3 install ansible --upgrade

USER jenkins  

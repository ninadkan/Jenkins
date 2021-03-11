FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y openssh-server


RUN groupadd -g 2000 ninadk

RUN useradd -mr -d /home/ninadk -s /bin/bash -g ninadk -G sudo -u 1001 ninadk && \
    mkdir /home/ninadk/.ssh && \
    chmod 700 /home/ninadk/.ssh

RUN echo 'ninadk:ninadk' | chpasswd

COPY remote-key.pub /home/ninadk/.ssh/authorized_keys

RUN chown ninadk:ninadk -R /home/ninadk/.ssh/ && \
    chmod 600 /home/ninadk/.ssh/authorized_keys

RUN service ssh start

CMD ["/usr/sbin/sshd", "-D"]

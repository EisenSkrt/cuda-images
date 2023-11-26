ARG VERSION
ARG UBUNTU
FROM docker.io/nvidia/cuda:$VERSION.0-runtime-ubi8

USER root

RUN yum update -y && \
    yum install -y python38

COPY start.sh /start.sh 

COPY sshd_config /sshd_config

RUN useradd -m roger && \
    echo "roger:federer" | chpasswd && \
    chmod g+w /etc/passwd /etc/group && \
    chmod 640 /etc/shadow && \ 
    usermod -a -G root roger && \
    yum install -y openssh-server && \
    yum install -y git && \
    chmod +x /start.sh && \
    chmod +r /sshd_config

EXPOSE 2222

USER roger

CMD /start.sh
ENV IMAGE_TYPE=debugger

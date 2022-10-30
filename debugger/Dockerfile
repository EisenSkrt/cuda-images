ARG VERSION
FROM docker.io/nvidia/cuda:$VERSION.0-runtime-ubi8

USER root

RUN dnf install -y python38

COPY start.sh /start.sh 

COPY sshd_config /sshd_config

RUN useradd roger && \
    echo "roger:federer" | chpasswd && \
    chmod g+w /etc/passwd /etc/group && \
    dnf  update -y && \
    dnf install -y openssh-server && \
    chmod +x /start.sh && \
    chmod +r /sshd_config && \
    echo "export PATH=$PATH" >> /home/roger/.bashrc

EXPOSE 2222

USER roger

CMD /start.sh

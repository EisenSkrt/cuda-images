ARG VERSION
ARG UBUNTU
FROM docker.io/nvidia/cuda:$VERSION-runtime-ubi8

USER root

RUN yum update -y && \
    yum install -y wget make cmake gcc bzip2-devel libffi-devel zlib-devel && \
    wget https://www.python.org/ftp/python/3.10.8/Python-3.10.8.tgz && \
    tar xzf Python-3.10.8.tgz && \
    cd Python-3.10.8 && \
    ./configure --with-system-ffi --with-computed-gotos --enable-loadable-sqlite-extensions && \
    make -j ${nproc} && \
    make altinstall 

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

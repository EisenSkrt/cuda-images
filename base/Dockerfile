ARG VERSION
ARG UBUNTU
FROM docker.io/nvidia/cuda:$VERSION-runtime-ubi8

RUN yum update -y && \
    yum install -y git && \
    yum install -y wget make cmake gcc bzip2-devel libffi-devel zlib-devel && \
    useradd jovyan

RUN wget https://www.python.org/ftp/python/3.10.8/Python-3.10.8.tgz && \
    tar xzf Python-3.10.8.tgz && \
    cd Python-3.10.8 && \
    ./configure --with-system-ffi --with-computed-gotos --enable-loadable-sqlite-extensions && \
    make -j ${nproc} && \
    make altinstall

USER jovyan

WORKDIR /home/jovyan
ENV IMAGE_TYPE=base

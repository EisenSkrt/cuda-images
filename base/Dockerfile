ARG VERSION
ARG UBUNTU
FROM docker.io/nvidia/cuda:$VERSION.0-runtime-ubi8

RUN yum update -y && \
    yum install -y python38 && \
    yum install -y git && \
    useradd jovyan

USER jovyan

WORKDIR /home/jovyan

ARG VERSION
FROM docker.io/nvidia/cuda:11.8.0-runtime-ubi8

RUN dnf install -y python38 && \
    useradd jovyan

USER jovyan

WORKDIR /home/jovyan

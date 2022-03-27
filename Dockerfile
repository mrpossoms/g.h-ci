# syntax=docker/dockerfile:1
FROM nvidia/opengl:1.2-glvnd-devel-ubuntu20.04

ENV TZ=America
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# get pre-req packages
RUN apt-get update && \
    apt-get install -y build-essential curl git cmake libffi-dev libreadline-dev zlib1g-dev libssl-dev libglu1-mesa-dev libx11-dev libxrandr-dev

# build python3
RUN curl -L https://www.python.org/ftp/python/3.10.4/Python-3.10.4.tgz | tar -xz && \
    cd Python* && \
    ./configure && make install -j && \
    ln /usr/local/bin/python3 /usr/local/bin/python

# install gitman
RUN pip3 install gitman

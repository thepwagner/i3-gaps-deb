FROM debian:buster

ARG http_proxy=http://192.168.86.40:3128
COPY sources.list /etc/apt/sources.list

RUN apt-get update && \
  apt-get install -y \
    git \
    libxcb-shape0-dev \
    meson && \
  apt-get build-dep -y \
    i3-wm

COPY patchrules.sh /patchrules.sh

WORKDIR /i3gaps
ARG I3_COMMIT=991824ab2f570a9fb78b83ec73ecae10b83f9877
RUN git init . && \
  git remote add origin https://github.com/Airblader/i3 && \
  git fetch --depth 1 origin $I3_COMMIT && \
  git checkout $I3_COMMIT && \
  sh /patchrules.sh
RUN dpkg-buildpackage -us -uc

#
# crosstool-NG Dockerfile
#
# https://github.com/donatoaz/dockerfile-crosstool-NG
#

# Pull base image.
FROM ubuntu:18.04
MAINTAINER Donato Azevedo <donatoaz@gmail.com>

# Install.
RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y wget bash-completion git bc && \
  apt-get install -y build-essential gperf bison flex texinfo gawk libtool automake libncurses5-dev libexpat1-dev python-dev help2man && \
  apt-get install -y qemu-system && \
  rm -rf /var/lib/apt/lists/*

# Install crosstool-NG.
RUN \
  wget http://crosstool-ng.org/download/crosstool-ng/crosstool-ng-1.23.0.tar.bz2 && \
  tar xjf crosstool-ng-1.23.0.tar.bz2 && \
  cd crosstool-ng-1.23.0 && \
  ./configure && \
  make install && \
  mkdir -p /etc/bash_completion.d/ && cp ct-ng.comp /etc/bash_completion.d/ && \
  rm -rf ../crosstool-ng-1.23.0

# Set environment variables.
ENV USER crosstool-ng
ENV HOME /home/$USER

# Create new user
RUN \
  useradd -m $USER && \
  mkdir -p /etc/sudoers.d/ && \
  echo "$USER ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USER

# Define user name.
USER $USER

# Define working directory.
WORKDIR $HOME

# Define default command.
CMD ["bash"]

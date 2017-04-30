# Copyright (c) University of Rochester
# Distributed under GPL License 3.0
# ------------------------------------------------
# Dockerfile to run gromacs on an ubuntu base install with plumed 

FROM ubuntu:zesty
MAINTAINER Andrew White <andrew.white@rochester.edu>

#enable contributed packages
RUN sed -i 's/main/main contrib/g' /etc/apt/sources.list
#install dependencies
RUN apt-get update && apt-get install -y libfftw3-dev git cmake g++ gcc libblas-dev xxd

#get plumed
RUN git clone https://github.com/whitead/plumed2 /srv/plumed
WORKDIR /srv/plumed
RUN git checkout cn-moment-pr
RUN ./configure --enable-modules=all && make -j4 && make install

#get gromacs
RUN git clone https://github.com/gromacs/gromacs /srv/gromacs
WORKDIR /srv/gromacs
RUN git fetch --tags && git checkout v2016.3
RUN echo 2 | plumed patch -p
RUN mkdir build
WORKDIR /srv/gromacs/build
RUN cmake .. && make -j4 install
RUN ln -s /usr/local/gromacs/bin/gmx /usr/bin/gmx


ENV SHELL /bin/bash
ENV USER whitelab
ENV UID 1000
ENV HOME /home/$USER
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# Create whitelab user with UID=1000 and in the 'users' group
RUN useradd -m -s /bin/bash -N -u $UID $USER
USER $USER
RUN mkdir /home/$USER/scratch
WORKDIR /home/$USER/scratch

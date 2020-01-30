# Copyright (c) University of Rochester
# Distributed under GPL License 3.0
# ------------------------------------------------
# Dockerfile to run gromacs on an ubuntu base install with plumed

FROM ubuntu:rolling
MAINTAINER Andrew White <andrew.white@rochester.edu>

#enable contributed packages
#RUN sed -i 's/main/main contrib/g' /etc/apt/sources.list

RUN cat /etc/apt/sources.list
#install dependencies
RUN apt-get update && apt-get install -y libfftw3-dev git cmake g++ gcc libblas-dev xxd openmpi-bin libopenmpi-dev && apt-get clean

#get plumed
RUN git clone -b v2.6 https://github.com/plumed/plumed2 /srv/plumed
WORKDIR /srv/plumed
RUN ./configure --enable-modules=all --prefix=/usr/share && make -j4 && make install && make clean

#get gromacs
RUN git clone https://github.com/gromacs/gromacs /srv/gromacs
WORKDIR /srv/gromacs
RUN git fetch --tags && git checkout v2019.1
RUN /bin/bash -c "source /srv/plumed/sourceme.sh";\
    echo 2 | plumed patch -p;\
    mkdir build build_mpi;\
    cd /srv/gromacs/build;\
    cmake .. && make -j4 install && make clean;\
    ln -s /usr/local/gromacs/bin/gmx /usr/bin/gmx;\
    cd ../build_mpi;\
    cmake .. -DGMX_MPI=on && make -j4 install && make clean;\
    ln -s /usr/local/gromacs/bin/gmx_mpi /usr/bin/gmx_mpi;


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

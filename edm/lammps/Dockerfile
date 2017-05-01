# Copyright (c) University of Rochester
# Distributed under GPL License 3.0
# ------------------------------------------------
# Dockerfile to run lammps on a debian base install with electronic-dance-music pacakge

FROM debian:sid

MAINTAINER Andrew White <andrew.white@rochester.edu>

RUN apt-get update
RUN apt-get install -y git make gcc gfortran wget bc python-dev fftw3-dev mpich g++ libjpeg-dev libpng-dev libblas-dev libgsl0-dev xxd cmake libboost-all-dev && apt-get clean

RUN git clone https://github.com/whitead/electronic-dance-music /srv/edm
RUN git clone https://github.com/lammps/lammps.git /srv/lammps


WORKDIR /srv/edm
RUN mkdir build && cd build &&  \
    cmake .. -DLAMMPS_SRC=/srv/lammps/src && \
    make install && \
    make patch && \
    cd .. && rm -r build 

WORKDIR /srv/lammps/src
RUN python Make.py -m ubuntu -fft fftw3 -a file
RUN python Make.py -a lib-meam lib-poems lib-reax
RUN python Make.py -p standard no-compress no-gpu no-kim no-kokkos no-voronoi no-mscg
RUN make yes-user-edm
RUN make -j4 auto && cp lmp_auto /usr/bin/lmp_mpi && make clean-all

RUN ln -s /srv/lmp_mpi /usr/bin/lammps

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

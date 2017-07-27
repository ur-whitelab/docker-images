# Copyright (c) University of Rochester
# Distributed under GPL License 3.0
# ------------------------------------------------
# Dockerfile to run lammps on a debian base install with plumed 

FROM debian:sid
MAINTAINER Andrew White <andrew.white@rochester.edu>

RUN apt-get update
RUN apt-get install -y git make gcc gfortran wget bc python-dev fftw3-dev mpich g++ libjpeg-dev libpng-dev libblas-dev libgsl0-dev xxd && apt-get clean

#RUN echo bus=greagr
COPY plumed1.tar /srv
RUN cd /srv && tar -xf /srv/plumed1.tar && mv plumed-pinion plumed


RUN git clone https://github.com/lammps/lammps.git /srv/lammps && cd /srv/lammps && git checkout ae56b9a

WORKDIR /srv/lammps
RUN cp /srv/plumed/patches/plumedpatch_lammps_28-6-2014.sh . &&  env plumedir=/srv/plumed ./plumedpatch_lammps_28-6-2014.sh -patch

WORKDIR /srv/lammps/src
RUN python Make.py -m ubuntu -fft fftw3 -a file -flags CCFLAGS add 2 DLAMMPS_PLUMED DDUMP_EDS
#RUN python Make.py -m ubuntu -fft fftw3 -a file -flags CCFLAGS add 1 DLAMMPS_PLUMED 
RUN python Make.py -a lib-meam lib-poems lib-reax
RUN python Make.py -p standard no-compress no-gpu no-kim no-kokkos no-voronoi no-mscg
RUN make yes-user-plumed
RUN make -j4 auto && cp lmp_auto /usr/bin/lmp_mpi && make clean-all

RUN ln -s /usr/bin/lmp_mpi /usr/bin/lammps

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

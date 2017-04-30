#
# Dockerfile to run lammps on a debian base install

FROM debian:sid

RUN apt-get update
RUN apt-get install -y git make gcc gfortran wget bc python-dev fftw3-dev mpich g++ libjpeg-dev libpng-dev libblas-dev libgsl0-dev xxd

#RUN echo bus=greagr
RUN git clone https://github.com/whitead/plumed2 /srv/plumed

WORKDIR /srv/plumed
RUN git checkout cn-moment-pr
RUN ./configure --enable-modules=all && make -j4 && make install


RUN git clone https://github.com/lammps/lammps.git /srv/lammps

WORKDIR /srv/lammps
RUN echo 5 | plumed patch -p

WORKDIR /srv/lammps/src
RUN python Make.py -m ubuntu -fft fftw3 -a file
RUN python Make.py -a lib-meam lib-poems lib-reax
RUN python Make.py -p standard no-compress no-gpu no-kim no-kokkos no-voronoi no-mscg
RUN make yes-user-plumed
RUN make -j4 auto && cp lmp_auto /usr/bin/lmp_mpi

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

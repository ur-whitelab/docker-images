# Copyright (c) University of Rochester
# Distributed under GPL License 3.0
# ------------------------------------------------
# Dockerfile to run cp2k on an ubuntu base plumed package. Currently non-functional

FROM ubuntu:zesty
MAINTAINER Andrew White <andrew.white@rochester.edu>

RUN apt-get update && apt-get install -y build-essential \
    	    	       gcc \
		       g++ \
		       gfortran \
		       libatlas-dev \
		       liblapack-dev \
		       libmpich-dev \
		       libscalapack-mpi-dev \
		       git \
		       python \
		       libfftw3-dev \
		       wget \
		       cmake \
		       xxd \
		       libgsl0-dev \		       
		       libz-dev && apt-get clean

#need to switch to bash to utilize source 
RUN echo "dash dash/sh boolean false" | debconf-set-selections
RUN dpkg-reconfigure -f noninteractive dash


#get plumed2 installed
RUN git clone https://github.com/whitead/plumed2 /srv/plumed
WORKDIR /srv/plumed
RUN ./configure --enable-modules=all && make -j4 && make install && make clean

#get cp2k and dependencies
RUN git clone https://github.com/cp2k/cp2k.git /srv/cp2k
WORKDIR /srv/cp2k/cp2k
RUN cd tools/toolchain && \
    ./install_cp2k_toolchain.sh --with-fftw=system --with-reflapack=no && \
    rm build/*tgz && \
    cp install/arch/* arch 

#add plumed2 to arch file
RUN echo "include /usr/local/lib/plumed/src/lib/Plumed.inc.shared" >> arch/local.ssmp
RUN sed -i 's/LIBS\s\+=\(.*\)/LIBS=\1 -lz -lmpi_cxx -lrt -lplumed/' arch/local.ssmp
RUN sed -i 's/DFLAGS\s\+=\(.*\)/DFLAGS=\1 -D__PLUMED2/' arch/local.ssmp

#now compile
RUN source /srv/cp2k/cp2k/tools/toolchain/install/setup
RUN cd /srv/cp2k/cp2k/makefiles/ && \
    make -j4 ARCH=local VERSION=ssmp && \
    cp /srv/cp2k/cp2k/exe/local/cp2k.ssmp /usr/bin/cp2k && \
    make clean

#Make plumed locatable
RUN ldconfig

#setup bash terminal
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
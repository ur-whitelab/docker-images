# Copyright (c) University of Rochester
# Distributed under GPL License 3.0
# ------------------------------------------------
# Dockerfile to run cp2k on an ubuntu base plumed package. Currently non-functional

FROM ubuntu:zesty
MAINTAINER Andrew White <andrew.white@rochester.edu>


RUN apt-get update
RUN apt-get install -y build-essential \
    	    	       gcc \
		       g++ \
		       gfortran \
		       libatlas-dev \
		       libblas-dev \
		       libopenblas-dev \
		       libmpich-dev \
		       libscalapack-mpi-dev \
		       git \
		       python \
		       libfftw3-dev \
		       wget \
		       cmake

#need to switch to bash to utilize source 
RUN echo "dash dash/sh boolean false" | debconf-set-selections
RUN dpkg-reconfigure -f noninteractive dash


#get plumed2 installed
RUN git clone https://github.com/whitead/plumed2 /srv/plumed
WORKDIR /srv/plumed
RUN ./configure --enable-modules=all && make -j4 && make install

#get cp2k and dependencies
RUN git clone https://github.com/cp2k/cp2k.git /srv/cp2k
WORKDIR /srv/cp2k/cp2k
RUN cd tools/toolchain && ./install_cp2k_toolchain.sh --with-fftw=system --with-reflapack=no
RUN cp tools/toolchain/install/arch/* arch

#now prepare to compile
RUN source /srv/cp2k/cp2k/tools/toolchain/install/setup
#add plumed2 to arch file
RUN echo "include /usr/local/lib/plumed/src/lib/Plumed.inc.shared" >> arch/local.ssmp
RUN echo "LIBS=$(LIBS) -lz -ldl -lstdc++ -lmpi_cxx -lrt -lplumed" >> arch/local.ssmp
RUN cd /srv/cp2k/cp2k/makefiles/ && make -j2 ARCH=local VERSION=ssmp

FROM ubuntu:zesty


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
		       wget 
RUN git clone https://github.com/cp2k/cp2k.git /srv/cp2k
WORKDIR /srv/cp2k/cp2k
RUN cd tools/toolchain && ./install_cp2k_toolchain.sh --with-fftw=system --with-reflapack=no


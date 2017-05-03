# Copyright (c) University of Rochester
# This docker file is licensed via AGPL 3.0 due to gw000 image licensing
# ------------------------------------------------
# Dockerfile to use keras. Currently non-functional

FROM gw000/keras-full
MAINTAINER Andrew White <andrew.white@rochester.edu>

#install keras-molecules dependencies
RUN apt-get update && apt-get install -y python-rdkit librdkit1 rdkit-data wget && apt-get clean
#RUN wget https://github.com/git-lfs/git-lfs/releases/download/v2.0.2/git-lfs-linux-amd64-2.0.2.tar.gz
#RUN tar -xzvf git-lfs-linux-amd64-2.0.2.tar.gz && chmod +x git-lfs-2.0.2/install.sh
#RUN ./git-lfs-2.0.2/install.sh
#RUN git lfs install
#RUN pip --no-cache-dir install h5py tables scikit-learn progressbar tensorflow
RUN pip3 --no-cache-dir install h5py tables scikit-learn tensorflow tqdm
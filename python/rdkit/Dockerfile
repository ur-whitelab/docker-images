# Copyright (c) University of Rochester
# Distributed under GPL License 3.0
# ------------------------------------------------
# Dockerfile to run rdkit and graphviz in an nb-extensions enbled jupyter notebook


FROM whitelab/python/notebook-extensions
MAINTAINER Andrew White <andrew.white@rochester.edu>

USER jovyan
RUN conda clean -a
RUN conda install -c rdkit rdkit
USER root
RUN apt-get update
RUN apt-get install -y libgraphviz-dev graphviz pkg-config
USER jovyan
RUN pip3 install pygraphviz

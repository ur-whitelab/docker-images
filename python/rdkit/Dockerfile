# Copyright (c) University of Rochester
# Distributed under GPL License 3.0
# ------------------------------------------------
# Dockerfile to run rdkit and graphviz in an nb-extensions enbled jupyter notebook


FROM jupyter/scipy-notebook
MAINTAINER Andrew White <andrew.white@rochester.edu>

USER root
RUN apt-get update && apt-get install -y libgraphviz-dev graphviz pkg-config && apt-get clean

USER jovyan
RUN conda install -y -c rdkit rdkit && conda clean -a
RUN pip install --no-cache-dir --upgrade pygraphviz svgutils networkx

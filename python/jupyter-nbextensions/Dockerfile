# Copyright (c) University of Rochester
# Distributed under GPL License 3.0
# ------------------------------------------------
# Dockerfile to run jupyter notebooks with the nb extensions enabled

FROM jupyter/scipy-notebook
MAINTAINER Andrew White <andrew.white@rochester.edu>

USER jovyan

RUN conda install -c conda-forge jupyter_contrib_nbextensions
RUN jupyter contrib nbextension install --user
RUN jupyter nbextension enable spellcheck/main
RUN jupyter nbextension enable chrome-clipboard/main
RUN jupyter nbextension enable rubberband/main
# Copyright (c) University of Rochester
# Distributed under GPL License 3.0
# ------------------------------------------------
# Dockerfile to run pymc3 in a jupyter notebook with nb-extensions

FROM whitelab/python/notebook-extensions
MAINTAINER Andrew White <andrew.white@rochester.edu>

USER jovyan

RUN conda install -y pymc3 theano mkl-service
RUN conda update -y matplotlib numpy
RUN pip install --upgrade git+git://github.com/pymc-devs/pymc3 --no-deps
RUN pip install --upgrade git+git://github.com/theano/theano.git

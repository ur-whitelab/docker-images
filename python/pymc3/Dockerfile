FROM notebook-extensions

USER jovyan

RUN conda install -y pymc3 theano mkl-service
RUN conda update -y matplotlib numpy
RUN pip install --upgrade git+git://github.com/pymc-devs/pymc3 --no-deps
RUN pip install --upgrade git+git://github.com/theano/theano.git

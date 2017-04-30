FROM notebook-extensions

USER jovyan
RUN conda clean -a
RUN conda install -c rdkit rdkit
USER root
RUN apt-get update
RUN apt-get install -y libgraphviz-dev graphviz pkg-config
USER jovyan
RUN pip3 install pygraphviz

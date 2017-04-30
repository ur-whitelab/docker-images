FROM jupyter/scipy-notebook

USER jovyan

RUN conda install -c conda-forge jupyter_contrib_nbextensions
RUN jupyter contrib nbextension install --user
RUN jupyter nbextension enable spellcheck/main
RUN jupyter nbextension enable chrome-clipboard/main
RUN jupyter nbextension enable rubberband/main
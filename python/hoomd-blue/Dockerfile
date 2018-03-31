FROM conda/c3i-linux-64
MAINTAINER Andrew White <andrew.white@rochester.edu>


RUN conda config --add channels glotzer && conda install -y hoomd fresnel gsd freud &&  conda clean -a
RUN conda install -y Pillow \
        h5py \
        ipykernel \
        jupyter \
        matplotlib \
        numpy \
        networkx \
        scipy \
        pygraphviz \
        tqdm \
        && \
python -m ipykernel.kernelspec && \
conda clean -a

RUN pip install pyquaternion

EXPOSE 8888

WORKDIR "/notebooks"

CMD ["jupyter", "notebook", "--allow-root", "--ip=0.0.0.0"]
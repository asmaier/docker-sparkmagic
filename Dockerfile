FROM jupyter/scipy-notebook

MAINTAINER Andreas Maier <asmaier@web.de>

USER root

# This is needed because requests-kerberos fails to install on debian due to missing linux headers
# (see https://stackoverflow.com/questions/20992032/pynfs-error-gssapi-gssapi-h-no-such-file-or-directory)
RUN apt-get update
RUN apt-get -y install libkrb5-dev

USER $NB_USER

# Install sparkmagic
RUN pip install sparkmagic 
RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension
#RUN jupyter-kernelspec install --user $(pip show sparkmagic | grep Location | cut -d" " -f2)/sparkmagic/kernels/sparkkernel
#RUN jupyter-kernelspec install --user $(pip show sparkmagic | grep Location | cut -d" " -f2)/sparkmagic/kernels/pysparkkernel
#RUN jupyter-kernelspec install --user $(pip show sparkmagic | grep Location | cut -d" " -f2)/sparkmagic/kernels/pyspark3kernel
#RUN jupyter-kernelspec install --user $(pip show sparkmagic | grep Location | cut -d" " -f2)/sparkmagic/kernels/sparkrkernel
#RUN jupyter serverextension enable --py sparkmagic

# run with docker run -it --rm -p 9999:9999 sparkmagic start-notebook.sh --NotebookApp.port=9999 
# to switch port to 9999
EXPOSE 9999
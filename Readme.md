# docker-sparkmagic
Docker container with Jupyter, scipy ( derived from 
[jupyter/docker-stacks/scipy-notebook](https://github.com/jupyter/docker-stacks/tree/master/scipy-notebook) ) and [sparkmagic](https://github.com/jupyter-incubator/sparkmagic). The port of the Jupyter notebook app has been changed to 9999 to not collide with the Hortonworks sandbox when running on the same machine. 

## Usage

    docker run -it --rm -p 9999:9999 sparkmagic start-notebook.sh --NotebookApp.port=9999
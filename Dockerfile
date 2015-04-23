FROM ubuntu:15.04

EXPOSE 8888

RUN apt-get update -y -q
RUN apt-get -y -q install nodejs-legacy npm python-virtualenv python-dev git python-pip
RUN pip install --upgrade setuptools pip
WORKDIR /root
RUN git clone --depth=1 https://github.com/jupyter/jupyter_notebook.git
WORKDIR /root/jupyter_notebook
RUN pip install -r requirements.txt -e .
RUN mkdir /notebooks
CMD ["jupyter", "notebook", "--no-browser", "--ip=0.0.0.0","--notebook-dir=/notebooks"]

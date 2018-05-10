FROM nvidia/cuda:9.1-cudnn7-devel-ubuntu16.04

RUN apt update -y && apt-get install -y software-properties-common  python-software-properties && add-apt-repository ppa:deadsnakes/ppa && apt update -y && apt upgrade -y  && apt install -y tmux emacs htop wget git gcc g++ graphviz python3.6-dev libhdf5-dev libopenblas-dev liblapack-dev libblas-dev cmake

RUN wget https://bootstrap.pypa.io/get-pip.py && python3.6 get-pip.py && python3.6 -m pip install -U pip && python3.6 -m pip install tensorflow-gpu pytest pytest-cov python-coveralls coverage pytest-pep8 pydot_ng graphviz jupyter Pillow scikit-learn pandas matplotlib nose pyyaml nose six h5py numpy mock scipy seaborn numpy keras http://download.pytorch.org/whl/cu91/torch-0.4.0-cp36-cp36m-linux_x86_64.whl pyro-ppl

WORKDIR /workspace/
CMD jupyter notebook --ip=0.0.0.0 --port=8888 --allow-root
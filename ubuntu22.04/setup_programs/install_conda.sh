#!/bin/bash

echo "Start Install mini-conda!"

mkdir ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
~/miniconda3/bin/conda init bash

source ~/.bashrc

echo "Start Install conda-forge!"

conda config --add channels conda-forge
conda config --set channel_priority strict
conda config --show channels

pip3 install jupyter notebook ipykernel

conda config --set auto_activate_base false


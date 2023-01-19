#!/bin/sh 

echo "Install slides dependencies"
echo "CTRL-C to stop"
read

python -m pip install --upgrade pip
python -m pip install jupyter
python -m pip install RISE
python -m pip install jupyter_contrib_nbextensions
jupyter contrib nbextension install
python -m pip install jupyterthemes

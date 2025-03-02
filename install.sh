#!/bin/bash

# install requirements
echo "Installing requirements..."
conda activate mode_env

echo "Installing Tacto..."
cd calvin_env/tacto
pip install -e .
echo "Installing Tacto done"

echo "Installing calvin_env..."
cd ..
pip install -e .
echo "Installing calvin_env done"

echo "Installing setuptools..."
pip install setuptools==57.5.0
echo "Installing setuptools done"

echo "Installing pyhash..."
cd pyhash-0.9.3
python setup.py build
python setup.py install
echo "Installing pyhash done"
cd ..

echo "Installing LIBERO..."
cd LIBERO
pip install -r requirements.txt
pip install -e .
pip install numpy~=1.23
echo "Installing LIBERO done"
cd ..

# when gpu device is over a100, replace the requirements.txt with requirements_h800.txt
pip install -r requirements.txt
echo "Requirements installed"
#!/bin/bash
nvidia-smi
apt-get install python3-tk -y
python -m pip install --upgrade pip
python -m pip install ipywidgets
python -m pip install tk-tools
python -m pip install setuptools==59.5.0
wget https://raw.githubusercontent.com/airctic/icevision/master/icevision_install.sh
bash icevision_install.sh cuda10
python resnext_run.py 

echo "Finalizado"
tail -f /dev/null


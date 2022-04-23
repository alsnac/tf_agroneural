#!/bin/bash
python3 -m pip install --upgrade pip
wget https://raw.githubusercontent.com/airctic/icevision/master/icevision_install.sh
bash icevision_install.sh cuda10
python resnext_run.py 

echo "Finalizado"
tail -f /dev/null


#!/bin/bash
wget https://raw.githubusercontent.com/airctic/icevision/master/icevision_install.sh
bash icevision_install.sh cuda11
python resnext_run.py 

tail -f /dev/null


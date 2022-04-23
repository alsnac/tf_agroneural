#!/bin/bash
wget https://raw.githubusercontent.com/airctic/icevision/master/icevision_install.sh
bash icevision_install.sh cuda10
pws
ls -la
python resnext_run.py 

echo "Finalizado"
tail -f /dev/null


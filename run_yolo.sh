#!/bin/bash
#tail -f /dev/null
#----------------------------------------------------------------------------------------------------------------------
pip install --upgrade pip
#pip uninstall --yes opencv-python
#pip uninstall --yes opencv-contrib-python
#pip uninstall --yes opencv-contrib-python-headless
#pip install --no-input opencv-python==4.5.5.64

echo "\nPWD \n"
pwd

echo "\nls -la \n"
ls -la
cd /usr/src/yolov5
python train.py --img 1024 --batch 30 --data data.yaml --weights yolov5x6.pt --name Model #--resume runs/train/Model5/weights/last.pt

#Modelos: yolov5s6  yolov5m6  yolov5l6  yolov5x6 (small, medium, large, extralarge)
#--cache: Mais rápido para treinar, mas enche a memória da GPU

echo "\nEnd of file!"
tail -f /dev/null

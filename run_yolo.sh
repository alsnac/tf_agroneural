#!/bin/bash
#tail -f /dev/null
#----------------------------------------------------------------------------------------------------------------------

cd /usr/src/yolov5
python train.py --img 1024 --batch 30 --data data.yaml --weights yolov5x6.pt --name Model #--resume runs/train/Model5/weights/last.pt

#Modelos: yolov5s6  yolov5m6  yolov5l6  yolov5x6 (small, medium, large, extralarge)
#--cache: Mais rápido para treinar, mas enche a memória da GPU

tail -f /dev/null

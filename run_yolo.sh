#!/bin/bash
#tail -f /dev/null
#----------------------------------------------------------------------------------------------------------------------

cd yolov5
python train.py --img 1024 --batch 30 --data data.yaml --weights yolov5x6.pt --name Model #--resume runs/train/Model5/weights/last.pt

tail -f /dev/null

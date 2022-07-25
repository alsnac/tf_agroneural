#!/bin/bash
#tail -f /dev/null
#----------------------------------------------------------------------------------------------------------------------

pip install opencv-python==4.5.5.64

ls -la
cd /usr/src/yolov5

echo "30 de batch"

#A100
#python train.py --img 1024 --batch 50 --data data.yaml --weights yolov5l6.pt --name Model --workers 2 #--resume runs/train/Model5/weights/last.pt


#V100
python train.py --img 1024 --batch 30 --data data.yaml --weights yolov5m6.pt --name Model --resume runs/train/Model2/weights/last.pt

#Modelos: yolov5s6  yolov5m6  yolov5l6  yolov5x6 (small, medium, large, extralarge)
#--cache: Mais rápido para treinar, mas enche a memória da GPU

echo "End of file!"
tail -f /dev/null

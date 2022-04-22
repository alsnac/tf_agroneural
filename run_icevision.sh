#!/bin/bash
pip install mmcv-full -f https://download.openmmlab.com/mmcv/dist/cu102/torch1.9.0/index.html
python resnext_run.py 

tail -f /dev/null


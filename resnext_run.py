import IPython
import os
from random import choice
import sys
import cv2
from icevision.all import *


#IPython.Application.instance().kernel.do_shutdown(True)

root = '/agroneural_pragas'
train_root = os.path.join(root, 'train')
test_root = os.path.join(root, 'test')
parser = parsers.VOCBBoxParser(
    annotations_dir=train_root, images_dir=train_root)
train_records, valid_records = parser.parse(
    RandomSplitter([0.80, 0.20], seed=1))

image_size = 1024
presize = 1024
train_tfms = tfms.A.Adapter(
    [*tfms.A.aug_tfms(size=(image_size, image_size), presize=presize), tfms.A.Normalize()])
valid_tfms = tfms.A.Adapter(
    [*tfms.A.resize_and_pad((image_size, image_size)), tfms.A.Normalize()])

train_ds = Dataset(train_records, train_tfms)
valid_ds = Dataset(valid_records, valid_tfms)

validAugmentation = tfms.A.Adapter(
    [*tfms.A.resize_and_pad((image_size, image_size)), tfms.A.Normalize()])
trainAugmentation = tfms.A.Adapter(
    [*tfms.A.aug_tfms(size=(image_size, image_size), presize=presize), tfms.A.Normalize()])

model_type = models.mmdet.vfnet
backbone = model_type.backbones.resnext101_32x4d_fpn_mdconv_c3_c5_mstrain_2x

model = model_type.model(backbone=backbone(
    pretrained=True), num_classes=len(parser.class_map))

train_dl = model_type.train_dl(
    train_ds, batch_size=16, num_workers=2, shuffle=True)
valid_dl = model_type.valid_dl(
    valid_ds, batch_size=16, num_workers=2, shuffle=False)

metrics = [COCOMetric(metric_type=COCOMetricType.bbox)]
cbs = [fastai.SaveModelCallback()]
learn = model_type.fastai.learner(
    dls=[train_dl, valid_dl], model=model, metrics=metrics, path='/agroneural_pragas/checkpoints')

learn.model.cuda()
learn.fine_tune(300, 3.3e-4, freeze_epochs=1, cbs=cbs)

#learn = model_type.fastai.learner(dls=[train_dl, valid_dl], model=model, metrics=metrics, path = '/agroneural_pragas/checkpoints')

# learn.load('/agroneural_pragas/checkpoints/models/model') #Inserir endereço do último checkpoint gerado
#cbs = [fastai.SaveModelCallback()]
#learn.fine_tune(1, 3e-4, cbs = cbs)

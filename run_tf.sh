#!/bin/bash
#tail -f /dev/null
#----------------------------------------------------------------------------------------------------------------------
#run_tf.sh ...
# 1      ${root}/${training_demo}/${pre_trained_models}
# 2      ${root}/${training_demo}/${my_models}/${model_name}
# 3      ${root}/${training_demo}
# 4      $my_models_env/$model_name_env
#----------------------------------------------------------------------------------------------------------------------


#----------------------------------------------------------------------------------------------------------------------
# NOME DO MODELO: nome da pasta ao finalizar o treinamento
#----------------------------------------------------------------------------------------------------------------------



#-----------------SSD Mobilenet v2 320x320---------------------
#model_name="ssd_mobilenet_v2_320x320_coco17_tpu-8"
#--------------------------------------------------------------

#-----------------EficienteDet D0------------------------------
#model_name="efficientdet_d0_coco17_tpu-32"
#--------------------------------------------------------------

#-----------------EficienteDet D1------------------------------
#model_name="efficientdet_d1_coco17_tpu-32"
#--------------------------------------------------------------


#-----------------EficienteDet D2------------------------------
#model_name = "efficientdet_d2_coco17_tpu-32"
#--------------------------------------------------------------

#-----------------EficienteDet D3------------------------------
#model_name = "efficientdet_d3_coco17_tpu-32"
#--------------------------------------------------------------

#-----------------EficienteDet D4------------------------------
model_name = "efficientdet_d4_coco17_tpu-32"
#--------------------------------------------------------------

#-----------------Faster R-CNN ResNet50 V1 1024x1024------------------------------
#model_name = "faster_rcnn_resnet50_v1_1024x1024_coco17_tpu-8"
#--------------------------------------------------------------

#-----------------EficienteDet D4------------------------------
#model_name = "efficientdet_d4_coco17_tpu-32"
#--------------------------------------------------------------

#-----------------EficienteDet D5------------------------------
#model_name = "efficientdet_d5_coco17_tpu-32"
#--------------------------------------------------------------

#----------------------------------------------------------------------------------------------------------------------

#-----------------ResNet152 v1 640x640------------------------------
#model_name = "ssd_resnet152_v1_fpn_640x640_coco17_tpu-8"
#--------------------------------------------------------------
#----------------------------------------------------------------------------------------------------------------------


#----------------------------------------------------------------------------------------------------------------------
#---------------------------------------------------modelo-pre-treinado------------------------------------------------
#Se quiser utilizar o modelo pre-treinando, adicionar em python model_main_tf2.py 
#mkdir $1
#cd $1
#wget "http://download.tensorflow.org/models/object_detection/tf2/20200711/${model_name}.tar.gz"
#tar -xf "${model_name}.tar.gz"
#rm "${model_name}.tar.gz"
#----------------------------------------------------------------------------------------------------------------------



#----------------------------------------------------------------------------------------------------------------------
#---------------------------------------------------baixando-o-pipeline------------------------------------------------
mkdir $2
cd  $2
rm pipeline.config
wget https://raw.githubusercontent.com/alsnac/tf_agroneural/main/pipeline.config
#----------------------------------------------------------------------------------------------------------------------



#----------------------------------------------------------------------------------------------------------------------
#--------------------------------------realizando-o-treinamento--------------------------------------------------------
cd $3

#Treinamento
python model_main_tf2.py --model_dir=$4 --pipeline_config_path="$4/pipeline.config"

#dar permissão para todos
#chmod -R 777 "models/my_model"

#remover modelo antigo caso exista
#rm -r "models/$model_name"

#renomear a pasta my_models para o nome do modelo
#mv models/my_model "models/$model_name"

#Exportar
#python exporter_main_v2.py --input_type image_tensor --pipeline_config_path="models/$model_name/pipeline.config" --trained_checkpoint_dir "models/$model_name" --output_directory "exported-models/"

#dar permissão para todos
#chmod -R 777 "$3/exported-models"

#Avaliação
#python model_main_tf2.py --model_dir="models/$model_name" --pipeline_config_path="models/$model_name/pipeline.config" --checkpoint_dir="models/$model_name" --num_workers=1 --sample_1_of_n_eval_examples=1
#----------------------------------------------------------------------------------------------------------------------

tail -f /dev/null

#!/bin/bash
# DOWNLOAD DO MODELO DEFINIDO

#run_tf.sh ...
# 1      ${root}/${training_demo}/${pre_trained_models}
# 2      ${root}/${training_demo}/${my_models}/${model_name}
# 3      ${root}/${training_demo}
# 4      $my_models_env/$model_name_env

# Parte do ID do pipeline.config do link de compartilhado gerado no Google Drive
pipeline_download_id="1d3wZD8nF_CLS-aL8fbdccM6RhVCFrapJ"
model_name = "efficientdet_d3_coco17_tpu-32"


mkdir $1
cd $1
wget "http://download.tensorflow.org/models/object_detection/tf2/20200711/${model_name}.tar.gz"
tar -xf "${model_name}.tar.gz"
rm "${model_name}.tar.gz"
mkdir $2
cd  $2
wget --no-check-certificate "https://docs.google.com/uc?export=download&id=${pipeline_download_id}" -O pipeline.config

cd $3

#Treinamento
python model_main_tf2.py --model_dir=$4 --pipeline_config_path="$4/pipeline.config"

#Avaliação
#python model_main_tf2.py --model_dir=$4 --pipeline_config_path="$4/pipeline.config" --checkpoint_dir=$4 --num_workers=1 --sample_1_of_n_eval_examples=1

#Exportar
#python exporter_main_v2.py --input_type image_tensor --pipeline_config_path="$4/pipeline.config" --trained_checkpoint_dir $4 --output_directory $exp_folder

tail -f /dev/null

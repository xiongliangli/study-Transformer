CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7 \
python main_multi_gpu_finetune.py \
-cfg='./configs/beit_base_patch16_224.yaml' \
-dataset='imagenet2012' \
-batch_size=256 \
-data_path='/dataset/imagenet' \
-pretrained='./beit_base_patch16_224.pdparams' \
-eval \
-amp

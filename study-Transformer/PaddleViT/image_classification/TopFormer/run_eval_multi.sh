CUDA_VISIBLE_DEVICES=4,5,6,7 \
python main_multi_gpu.py \
-cfg='./configs/topformer_base.yaml' \
-dataset='imagenet2012' \
-batch_size=128 \
-data_path='/dataset/imagenet' \
-pretrained='./topformer_base.pdparams' \
-eval \
-amp

CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7 \
python main_multi_gpu.py \
-cfg='./configs/convmixer_768_32.yaml' \
-dataset='imagenet2012' \
-batch_size=8 \
-data_path='/dataset/imagenet' \
-amp
CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7 \
python main_multi_gpu.py \
-cfg='./configs/focal_tiny_patch4_window7_224.yaml' \
-dataset='imagenet2012' \
-batch_size=64 \
-data_path='/dataset/imagenet' \
-pretrained='./focal_tiny_is224_ws7.pdparams' \
-eval \
-amp

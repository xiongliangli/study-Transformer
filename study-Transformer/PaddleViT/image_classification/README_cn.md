简体中文 | [English](./README.md)

# PaddleViT-Classification:图像分类领域的Visual Transformer 和 MLP 模型
PaddlePaddle用于图像分类的训练/评估代码和预训练模型。

此实现是 [PaddleViT](https://github.com/BR-IDL/PaddleViT.git) 项目的一部分.

## 更新
* 更新 (2022-08-29): 添加 MobileOne.
* 更新 (2022-07-15): 添加 RepLKNet.
* 更新 (2022-05-26): 添加 ResT 和 ResTV2.
* 更新 (2022-05-16): 添加 CoaT.
* 更新 (2022-05-16): 添加 ConvNeXt.
* 更新 (2022-04-22): 添加 TopFormer.
* 更新 (2021-12-30): 添加 MobileViT 模型和 multi scale sampler.
* 更新 (2021-12-28): 添加 HvT 模型.
* 更新 (2021-12-24): 添加 CvT 模型.
* 更新 (2021-12-23): 添加 BoTNet 模型.
* 更新 (2021-12-15): 添加 PoolFormer 模型.
* 更新 (2021-12-09): 添加 HaloNet 模型.
* 更新 (2021-12-08): 添加 PiT 模型.
* 更新 (2021-12-08): 添加 XCiT 模型.
* 更新 (2021-11-05): 更新 ConvMLP 模型.
* 更新 (2021-11-04): 更新 ConvMixer 模型.
* 更新 (2021-11-03): 更新 ViP 模型.
* 更新 (2021-10-28): 添加 MobileViT 模型.
* 更新 (2021-10-28): 添加 FocalTransformer 模型.
* 更新 (2021-10-28): 添加 CycleMLP 模型.
* 更新 (2021-10-19): 添加 BEiT model.
* 更新 (2021-10-12): 更新 Swin Transformer中从头开始训练的代码.
* 更新 (2021-09-28): 增加 AMP 训练.
* 更新 (2021-09-27): 添加更多ported model 权重.
* 更新 (2021-09-09): 添加 FF-Only, RepMLP 模型.
* 更新 (2021-08-25): 上传初始化readme.

## Quick Start
以下链接提供了每个模型架构的代码以及详细用法：
1. **[ViT](./ViT)**
2. **[DeiT](./DeiT)**
3. **[Swin](./SwinTransformer)**
4. **[VOLO](./VOLO)**
5. **[CSwin](./CSwin)**
6. **[CaiT](./CaiT)**
7. **[PVTv2](./PVTv2)**
8. **[Shuffle Transformer](./Shuffle_Transformer)**
9. **[T2T-ViT](./T2T_ViT)**
10. **[CrossViT](./CrossViT)**
10. **[Focal Transformer](./Focal_Transformer)**
11. **[BEiT](./BEiT)**
11. **[MobileViT](./MobileViT)**
11. **[ViP](./ViP)**
11. **[XCiT](./XCiT)**
11. **[PiT](./PiT)**
11. **[HaloNet](./HaloNet)**
12. **[PoolFormer](./PoolFormer)**
12. **[BoTNet](./BoTNet)**
12. **[CvT](./Cvt)**
12. **[HvT](./HVT)**
12. **[TopFormer](./TopFormer)**
12. **[ConvNeXt](./ConvNeXt)**
12. **[CoaT](./CoaT)**
13. **[MLP-Mixer](./MLP-Mixer)**
14. **[ResMLP](./ResMLP)**
15. **[gMLP](./gMLP)**
16. **[FF_Only](./FF_Only)**
17. **[RepMLP](./RepMLP)**
17. **[CycleMLP](./CycleMLP)**
17. **[ConvMixer](./ConvMixer)**
17. **[ConvMLP](./ConvMLP)**
17. **[ResT](./ResT)**
17. **[ResTV2](./ResT)**
17. **[RepLKNet](./RepLKNet)**
17. **[MobileOne](./MobileOne)**

## 安装
该模块在 Python3.6+ 和 PaddlePaddle 2.1.0+ 上进行了测试，多数依赖项通过PaddlePaddle安装。 您只需要安装以下包：
```shell
pip install yacs pyyaml
```
然后，下载github repo:
```shell
git clone https://github.com/BR-IDL/PaddleViT.git
cd PaddleViT/image_classification
```
> 注意：建议安装最新版本的PaddlePaddle以避免PaddleViT训练时出现一些CUDA错误。PaddlePaddle 稳定版本安装请参考 [link](https://www.paddlepaddle.org.cn/install/quick?docurl=/documentation/docs/zh/install/pip/linux-pip.html) 和 [link](https://www.paddlepaddle.org.cn/install/quick?docurl=/documentation/docs/zh/develop/install/pip/linux-pip.html#gpu) 用于开发版本安装. 

## 基本用法
### 数据准备
ImageNet2012 数据集使用以下的文件格式:
```
│imagenet/
├──train_list.txt
├──val_list.txt
├──train/
│  ├── n01440764
│  │   ├── n01440764_10026.JPEG
│  │   ├── n01440764_10027.JPEG
│  │   ├── ......
│  ├── ......
├──val/
│  ├── n01440764
│  │   ├── ILSVRC2012_val_00000293.JPEG
│  │   ├── ILSVRC2012_val_00002138.JPEG
│  │   ├── ......
│  ├── ......
```
其中：
- `train_list.txt`: 包含训练图像的相对路径和类别标签. 可以从这里下载该文件： [google](https://drive.google.com/file/d/10YGzx_aO3IYjBOhInKT_gY6p0mC3beaC/view?usp=sharing)/[baidu](https://pan.baidu.com/s/1G5xYPczfs9koDb7rM4c0lA?pwd=a4vm)
- `val_list.txt`: 包含val集图像的相对路径和类别标签. 可以从这里下载该文件： [google](https://drive.google.com/file/d/1aXHu0svock6MJSur4-FKjW0nyjiJaWHE/view?usp=sharing)/[baidu](https://pan.baidu.com/s/1TFGda7uBZjR7g-A6YjQo-g?pwd=kdga) 

### Demo 示例
如果需要使用具有预训练权重的模型，请转到特定子文件夹，然后下载 `.pdparam` 权重文件，并在以下python脚本中更改相关文件路径，模型配置文件位于 `./configs/`.  

假设下载的权重文件存储在`./vit_base_patch16_224.pdparams`中，在python中使用`vit_base_patch16_224`模型：

```python
from config import get_config
from visual_transformer import build_vit as build_model
# config files in ./configs/
config = get_config('./configs/vit_base_patch16_224.yaml')
# build model
model = build_model(config)
# load pretrained weights
model_state_dict = paddle.load('./vit_base_patch16_224.pdparams')
model.set_dict(model_state_dict)
```
> 详细用法详见各模型文件夹中的README文件。

## 基本概念
PaddleViT图像分类模块是以相似结构在单独的文件夹中为每一个模型开发的，每个实现大约有3种类型的类和2种类型的脚本：
1. **Model classes** 例如 **[transformer.py](./ViT/transformer.py)**, 其中定义了核心的 *transformer model* 和相关方法.
   
2. **Dataset classes** 例如 **[dataset.py](./ViT/datasets.py)**, 其中定义了 dataset, dataloader, data transforms. 我们提供了自定义数据加载的实现方式，并且支持单GPU和多GPU加载。
   
3. **Config classes** 例如 **[config.py](./ViT/config.py)**, 其中定义了模型训练/验证的配置. 通常不需要更改配置中的项目，我们通过python `arguments` 或者 `.yaml` 配置文件来更新配置。 您可以在 [here](../docs/ppvit-config.md) 查看配置设计和使用的详细信息.
   
4. **main scripts** 例如 **[main_single_gpu.py](./ViT/main_single_gpu.py)**, 其中定义了整个训练/验证程序，提供了训练或者验证的主要步骤，例如日志记录、加载/保存模型、微调等. 多GPU在单独的python 脚本 `main_multi_gpu.py`中实现.
   
5. **run scripts** 例如 **[run_eval_base_224.sh](./ViT/run_eval_base_224.sh)**, 其中定义了使用特定配置和参数运行python脚本的shell命令.
   

## 模型架构

PaddleViT 目前支持以下 **transfomer based models**:
1. **[ViT](./ViT)** (from Google), released with paper [An Image is Worth 16x16 Words: Transformers for Image Recognition at Scale](https://arxiv.org/abs/2010.11929), by Alexey Dosovitskiy, Lucas Beyer, Alexander Kolesnikov, Dirk Weissenborn, Xiaohua Zhai, Thomas Unterthiner, Mostafa Dehghani, Matthias Minderer, Georg Heigold, Sylvain Gelly, Jakob Uszkoreit, Neil Houlsby.
2. **[DeiT](./DeiT)** (from Facebook and Sorbonne), released with paper [Training data-efficient image transformers & distillation through attention](https://arxiv.org/abs/2012.12877), by Hugo Touvron, Matthieu Cord, Matthijs Douze, Francisco Massa, Alexandre Sablayrolles, Hervé Jégou.
3. **[Swin Transformer](./SwinTransformer)** (from Microsoft), released with paper [Swin Transformer: Hierarchical Vision Transformer using Shifted Windows](https://arxiv.org/abs/2103.14030), by Ze Liu, Yutong Lin, Yue Cao, Han Hu, Yixuan Wei, Zheng Zhang, Stephen Lin, Baining Guo.
4. **[VOLO](./VOLO)** (from Sea AI Lab and NUS), released with paper [VOLO: Vision Outlooker for Visual Recognition](https://arxiv.org/abs/2106.13112), by Li Yuan, Qibin Hou, Zihang Jiang, Jiashi Feng, Shuicheng Yan.
5. **[CSwin Transformer](./CSwin)** (from USTC and Microsoft), released with paper [CSWin Transformer: A General Vision Transformer Backbone with Cross-Shaped Windows
](https://arxiv.org/abs/2107.00652), by Xiaoyi Dong, Jianmin Bao, Dongdong Chen, Weiming Zhang, Nenghai Yu, Lu Yuan, Dong Chen, Baining Guo.
6. **[CaiT](./CaiT)** (from Facebook and Sorbonne), released with paper [Going deeper with Image Transformers](https://arxiv.org/abs/2103.17239), by Hugo Touvron, Matthieu Cord, Alexandre Sablayrolles, Gabriel Synnaeve, Hervé Jégou.
7. **[PVTv2](./PVTv2)** (from NJU/HKU/NJUST/IIAI/SenseTime), released with paper [PVTv2: Improved Baselines with Pyramid Vision Transformer](https://arxiv.org/abs/2106.13797), by Wenhai Wang, Enze Xie, Xiang Li, Deng-Ping Fan, Kaitao Song, Ding Liang, Tong Lu, Ping Luo, Ling Shao.
8. **[Shuffle Transformer](./Shuffle_Transformer)** (from Tencent), released with paper [Shuffle Transformer: Rethinking Spatial Shuffle for Vision Transformer](https://arxiv.org/abs/2106.03650), by Zilong Huang, Youcheng Ben, Guozhong Luo, Pei Cheng, Gang Yu, Bin Fu.
9. **[T2T-ViT](./T2T_ViT)** (from NUS and YITU), released with paper [Tokens-to-Token ViT: Training Vision Transformers from Scratch on ImageNet
](https://arxiv.org/abs/2101.11986), by Li Yuan, Yunpeng Chen, Tao Wang, Weihao Yu, Yujun Shi, Zihang Jiang, Francis EH Tay, Jiashi Feng, Shuicheng Yan.
10. **[CrossViT](./CrossViT)** (from IBM), released with paper [CrossViT: Cross-Attention Multi-Scale Vision Transformer for Image Classification](https://arxiv.org/abs/2103.14899), by Chun-Fu Chen, Quanfu Fan, Rameswar Panda.
11. **[BEiT](./BEiT)** (from Microsoft Research), released with paper [BEiT: BERT Pre-Training of Image Transformers](https://arxiv.org/abs/2106.08254), by Hangbo Bao, Li Dong, Furu Wei.
12. **[Focal Transformer](./Focal_Transformer)** (from Microsoft), released with paper [Focal Self-attention for Local-Global Interactions in Vision Transformers](https://arxiv.org/abs/2107.00641), by Jianwei Yang, Chunyuan Li, Pengchuan Zhang, Xiyang Dai, Bin Xiao, Lu Yuan and Jianfeng Gao.
13. **[Mobile-ViT](./MobileViT)** (from Apple), released with paper [MobileViT: Light-weight, General-purpose, and Mobile-friendly Vision Transformer](https://arxiv.org/abs/2110.02178), by Sachin Mehta, Mohammad Rastegari.
14. **[ViP](./ViP)** (from Oxford/ByteDance), released with [Visual Parser: Representing Part-whole Hierarchies with Transformers](https://arxiv.org/abs/2107.05790), by Shuyang Sun, Xiaoyu Yue, Song Bai, Philip Torr.
15. **[XCiT](./XCiT)** (from Facebook/Inria/Sorbonne), released with paper [XCiT: Cross-Covariance Image Transformers](https://arxiv.org/abs/2106.09681), by Alaaeldin El-Nouby, Hugo Touvron, Mathilde Caron, Piotr Bojanowski, Matthijs Douze, Armand Joulin, Ivan Laptev, Natalia Neverova, Gabriel Synnaeve, Jakob Verbeek, Hervé Jegou.
16. **[PiT](./PiT)** (from NAVER/Sogan University), released with paper [Rethinking Spatial Dimensions of Vision Transformers](https://arxiv.org/abs/2103.16302), by Byeongho Heo, Sangdoo Yun, Dongyoon Han, Sanghyuk Chun, Junsuk Choe, Seong Joon Oh.
17. **[HaloNet](./HaloNet)**, (from Google), released with paper [Scaling Local Self-Attention for Parameter Efficient Visual Backbones](https://arxiv.org/abs/2103.12731), by Ashish Vaswani, Prajit Ramachandran, Aravind Srinivas, Niki Parmar, Blake Hechtman, Jonathon Shlens.
18. **[PoolFormer](./PoolFormer)**, (from Sea AI Lab/NUS), released with paper [MetaFormer is Actually What You Need for Vision](https://arxiv.org/abs/2111.11418), by Weihao Yu, Mi Luo, Pan Zhou, Chenyang Si, Yichen Zhou, Xinchao Wang, Jiashi Feng, Shuicheng Yan.
19. **[BoTNet](./BoTNet)**, (from UC Berkeley/Google), released with paper [Bottleneck Transformers for Visual Recognition](https://arxiv.org/abs/2101.11605), by Aravind Srinivas, Tsung-Yi Lin, Niki Parmar, Jonathon Shlens, Pieter Abbeel, Ashish Vaswani.
20. **[CvT](./Cvt)** (from McGill/Microsoft), released with paper [CvT: Introducing Convolutions to Vision Transformers](https://arxiv.org/abs/2103.15808), by Haiping Wu, Bin Xiao, Noel Codella, Mengchen Liu, Xiyang Dai, Lu Yuan, Lei Zhang
21. **[HvT](./HVT)** (from Monash University), released with paper [Scalable Vision Transformers with Hierarchical Pooling](https://arxiv.org/abs/2103.10619), by Zizheng Pan, Bohan Zhuang, Jing Liu, Haoyu He, Jianfei Cai.
22. **[TopFormer](./TopFormer)** (from HUST/Tencent/Fudan/ZJU), released with paper [TopFormer: Token Pyramid Transformer for Mobile Semantic Segmentation](https://arxiv.org/pdf/2204.05525.pdf), by Wenqiang Zhang, Zilong Huang, Guozhong Luo, Tao Chen, Xinggang Wang, Wenyu Liu, Gang Yu, Chunhua Shen.
22. **[ConvNeXt](./ConvNeXt)** (from FAIR/UCBerkeley), released with paper [A ConvNet for the 2020s](https://arxiv.org/abs/2201.03545), by Zhuang Liu, Hanzi Mao, Chao-Yuan Wu, Christoph Feichtenhofer, Trevor Darrell, Saining Xie.
22. **[CoaT](./CoaT)** (from UCSD), released with paper [Co-Scale Conv-Attentional Image Transformers](https://arxiv.org/abs/2104.06399), by Weijian Xu, Yifan Xu, Tyler Chang, Zhuowen Tu.
22. **[ResT](./ResT)** (from NJU), released with paper [ResT: An Efficient Transformer for Visual Recognition](https://arxiv.org/abs/2105.13677), by Qinglong Zhang, Yubin Yang.
22. **[ResTV2](./ResT)** (from NJU), released with paper [ResT V2: Simpler, Faster and Stronger](https://arxiv.org/abs/2204.07366), by Qinglong Zhang, Yubin Yang.


PaddleViT 目前支持以下 **MLP based models**:
1. **[MLP-Mixer](./MLP-Mixer)** (from Google), released with paper [MLP-Mixer: An all-MLP Architecture for Vision](https://arxiv.org/abs/2105.01601), by Ilya Tolstikhin, Neil Houlsby, Alexander Kolesnikov, Lucas Beyer, Xiaohua Zhai, Thomas Unterthiner, Jessica Yung, Andreas Steiner, Daniel Keysers, Jakob Uszkoreit, Mario Lucic, Alexey Dosovitskiy
2. **[ResMLP](./ResMLP)** (from Facebook/Sorbonne/Inria/Valeo), released with paper [ResMLP: Feedforward networks for image classification with data-efficient training](https://arxiv.org/abs/2105.03404), by Hugo Touvron, Piotr Bojanowski, Mathilde Caron, Matthieu Cord, Alaaeldin El-Nouby, Edouard Grave, Gautier Izacard, Armand Joulin, Gabriel Synnaeve, Jakob Verbeek, Hervé Jégou.
3. **[gMLP](./gMLP)** (from Google), released with paper [Pay Attention to MLPs](https://arxiv.org/abs/2105.08050), by Hanxiao Liu, Zihang Dai, David R. So, Quoc V. Le.
4. **[FF Only](./FF_Only)** (from Oxford), released with paper [Do You Even Need Attention? A Stack of Feed-Forward Layers Does Surprisingly Well on ImageNet](https://arxiv.org/abs/2105.02723), by Luke Melas-Kyriazi.
5. **[RepMLP](./RepMLP)** (from BNRist/Tsinghua/MEGVII/Aberystwyth), released with paper [RepMLP: Re-parameterizing Convolutions into Fully-connected Layers for Image Recognition](https://arxiv.org/abs/2105.01883), by Xiaohan Ding, Chunlong Xia, Xiangyu Zhang, Xiaojie Chu, Jungong Han, Guiguang Ding.
6. **[CycleMLP](./CycleMLP)** (from HKU/SenseTime), released with paper [CycleMLP: A MLP-like Architecture for Dense Prediction](https://arxiv.org/abs/2107.10224), by Shoufa Chen, Enze Xie, Chongjian Ge, Ding Liang, Ping Luo.
7. **[ConvMixer](./ConvMixer)** (from Anonymous), released with [Patches Are All You Need?](https://openreview.net/forum?id=TVHS5Y4dNvM), by Anonymous.
8. **[ConvMLP](./ConvMLP)** (from UO/UIUC/PAIR), released with [ConvMLP: Hierarchical Convolutional MLPs fo


PaddleViT 也支持以下 **reparameterized models**:

1. **[RepLKNet](./RepLKNet)** (from Tsinghua/MEGVII/Aberystwyth), released with [Scaling Up Your Kernels to 31x31: Revisiting Large Kernel Design in CNNs
](https://arxiv.org/abs/2203.06717), by Xiaohan Ding, Xiangyu Zhang, Yizhuang Zhou, Jungong Han, Guiguang Ding, Jian Sun.
2. **[MobileOne](./MobileOne)** (from Apple), released with [An Improved One millisecond Mobile Backbone](https://arxiv.org/abs/2206.04040), by Pavan Kumar Anasosalu Vasu, James Gabriel, Jeff Zhu, Oncel Tuzel, Anurag Ranjan.


## Contact
如果您有任何问题, 请在我们的Github上创建一个[issue](https://github.com/BR-IDL/PaddleViT/issues).

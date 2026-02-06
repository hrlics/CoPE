
<h2 align="center" style="font-size: 30px;">CoPE: Clipped RoPE as A Scalable Free Lunch for Long Context LLMs</h2>

<h5 align="center">
  
[![Paper](https://img.shields.io/badge/CoPE_paper-2F4858?style=for-the-badge&logo=arxiv&logoColor=white)](https://arxiv.org/abs/2602.05258)
[![Paper](https://img.shields.io/badge/HoPE_paper-A42C25?style=for-the-badge&logo=arxiv&logoColor=white)](https://arxiv.org/abs/2505.20444)
[![Hugging Face Collection](https://img.shields.io/badge/Checkpoints-fcd022?style=for-the-badge&logo=huggingface&logoColor=000)](https://huggingface.co/collections/haoranli-ml/cope)

</h5>


## 📢 News
- **\[02/05/2026\]** **CoPE** was released on [arXiv](https://arxiv.org/abs/2602.05258)! You can also check out our related work **[HoPE](https://arxiv.org/abs/2505.20444)** at NeurIPS 2025.


## ✨  Overview

**CoPE** is a plug-and-play enchancement of RoPE that *softly* clips the unstable low-frequency components, delivering consistent gains both **within the training context** and during **long-context extrapoaltion**.

<div align="center">
  <img src="assets/design.png" alt="Design" width="50%" style="display:inline-block; margin-right:10px;"/>
  <img src="assets/performance.png" alt="Performance" width="34%" style="display:inline-block;"/>
</div>


With a simple yet effective soft clipping strategy, CoPE

1️⃣ **Eliminates severe OOD outliers**, whose periods exceed the pre-training context window and are the primary cause of OOD extrapolation.

2️⃣ **Refines Long-range Semantic Signals** by alleviating the secret *long-term decay of semantic attention* introduced by RoPE.

3️⃣ **Prevents Spectral Leakage** induced by hard frequency truncation, which otherwise leads to long-range oscillatory ringing in the attention scores across relative token distances and introduces spurious correlations.


## ⚡ Download the Models

All our models and data are released on Hugging Face, including **RoPE, HardClip, and CoPE** checkpoints (64k) obtained via continued pre-training and SFT, starting from Llama-3-8B (8k). [[Link]](https://huggingface.co/collections/haoranli-ml/cope)


## 🛠️ Requirements
1. Clone this repository and install `transformers==4.50.0` from source
```
git clone https://github.com/hrlics/CoPE.git
cd CoPE
wget https://github.com/huggingface/transformers/archive/refs/tags/v4.50.0.tar.gz
tar -xzf v4.50.0.tar.gz
```

2. Replace the code in
```
CoPE/transformers-4.50.0/src/transformers/models/llama/modeling_llama.py
```
with `CoPE/modeling_cope.py`. And rename it back to `modeling_llama.py`.


## 🚀 Train

Our training code is based on [ProLong](https://github.com/princeton-nlp/ProLong).



Under `LLaMA-Factory/`, run the following script to start training:
```
train_hope.sh
```
Adjustments are made to `LLaMA-Factory/src/llamafactory/data/mm_plugin.py` to accomodate Qwen2-VL's training recipe.

## 🔍 Evaluation

#### Long Video Understanding

Evaluations on long video understanding are based on [lmms-eval](https://github.com/EvolvingLMMs-Lab/lmms-eval). The first step is to install relevant dependencies: 
```
cd lmms-eval
pip install -e .
```

Then, run the following script to start evaluations on MLVU, LongVideoBench, and Video-MME:
```
bash eval_LVU.sh
```

Adjustments are made to `lmms-eval/lmms_eval/models/qwen2_vl.py` to accomodate our evaluation configs.

#### Long Video Retrieval

Under `vision_niah/`, run the following script to produce haystack and needle embeddings for long video retrieval:
```
bash produce_haystack_and_needle_embedding.sh
```

Now, we can run evaluations:
```
bash eval.sh
```

## 📖 Citation
If you find our work helpful, please consider citing 📝 and giving us a star ⭐
```
@article{li2025hope,
  title={HoPE: Hybrid of Position Embedding for Length Generalization in Vision-Language Models},
  author={Li, Haoran and Qin, Yingjie and Ou, Baoyuan and Xu, Lai and Xu, Ruiwen},
  journal={arXiv preprint arXiv:2505.20444},
  year={2025}
}
```

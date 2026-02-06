conda create -n cope_train python=3.10 -y
conda activate cope_train
pip install torch==2.4.1
pip install -r requirements.txt
pip install flash-attn==2.6.1 --no-build-isolation
pip install git+https://github.com/Dao-AILab/flash-attention.git@9356a1c0389660d7e231ff3163c1ac17d9e3824a#subdirectory=csrc/rotary
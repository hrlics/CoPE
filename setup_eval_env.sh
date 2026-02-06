# install `transformers==4.50.0` from source
wget https://github.com/huggingface/transformers/archive/refs/tags/v4.50.0.tar.gz
tar -xzf v4.50.0.tar.gz
conda create -n cope_eval python=3.10 -y
conda activate cope_eval
cd transformers-4.50.0
pip install -e .
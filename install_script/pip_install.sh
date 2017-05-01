#!/bin/sh
# 入っていてほしい人たちをとりあえずインストール
# 
# 元の環境で
# pip freeze > requirements.txt
# requirements.txtを持ってきて
# pip install -r requirements.txt
# とすると良い

pip3 install numpy tensorflow-gpu pillow matplotlib keras sklearn
pip3 install jupyterlab seaborn plotly pandas
echo "CUDA_PATH is $CUDA_PATH (if set now, chainer will use gpu, or you need to reinstall chainer to use gpu)"
pip3 install chainer




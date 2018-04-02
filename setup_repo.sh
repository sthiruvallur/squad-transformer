#!/usr/bin/env bash

# Get directory containing this script
HEAD_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CODE_DIR=$HEAD_DIR/code
DATA_DIR=$HEAD_DIR/data
LOGS_DIR=$HEAD_DIR/logs

mkdir -p $LOGS_DIR
mkdir -p $DATA_DIR

# Creates the environment, named "fs" for Fast SQuAD
# conda create -n fs python=3.6

# Activates the environment
source activate fs

# pip install into environment
pip install -r requirements.txt

# Download GloVe vectors to data/
python "$CODE_DIR/preprocessing/download_wordvecs.py" --data_dir "$DATA_DIR"

# Download and preprocess SQuAD data and save in data/
python "$CODE_DIR/preprocessing/squad_preprocess.py" --data_dir "$DATA_DIR"

echo "Setup complete. Run 'source activate fs' to activate virtual environment."
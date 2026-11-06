#!/usr/bin/env bash
# 用法: bash test.sh configs/monodetr.yaml [实验名]
# 从 /root/gpufree-data/output/<实验名> 加载权重做评估
CONFIG=${1:-configs/monodetr.yaml}
EXP_ARG=""
if [ -n "$2" ]; then
    EXP_ARG="--exp_name $2"
fi

# numba 段错误规避（见 常用命令.md 坑 3）
export NUMBA_CUDA_USE_NVIDIA_BINDING=1

CUDA_VISIBLE_DEVICES=0 python tools/train_val.py --config "$CONFIG" -e $EXP_ARG

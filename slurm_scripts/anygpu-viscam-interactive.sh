#!/bin/bash -ex

srun --account viscam --partition=viscam-interactive --exclude=viscam1,viscam2 --gres=gpu:1 --mem=32G --pty bash 

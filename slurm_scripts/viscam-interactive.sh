#!/bin/bash -ex

srun --account viscam --partition=viscam-interactive --exclude=viscam1,viscam2 --gres=gpu:l40s:1 --mem=32G --pty bash

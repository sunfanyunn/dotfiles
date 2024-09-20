#!/bin/bash -ex

srun --account viscam --partition=viscam-interactive --gres=gpu:a6000:1 --mem=32G --pty bash

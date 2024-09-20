#!/bin/bash -ex
srun --account aal --partition=aal-interactive --gres gpu:1 --mem=16G --pty bash

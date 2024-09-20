#!/bin/bash -ex
#SBATCH --account=viscam
#SBATCH --partition=viscam
#SBATCH --job-name=default
#SBATCH --output=/viscam/projects/SceneAug/default_job_output.log
#SBATCH --error=/viscam/projects/SceneAug/default.log
#SBATCH --time=72:00:00
#SBATCH --ntasks=1
#SBATCH --gres=gpu:1
#SBATCH --mem=32G


tmux new-session -d -s "0" "sleep infinity"

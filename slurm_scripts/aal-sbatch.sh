#!/bin/bash -ex
#SBATCH --account=aal
#SBATCH --partition=aal
#SBATCH --job-name=default
#SBATCH --output=/viscam/projects/SceneAug/default_job_output.log
#SBATCH --error=/viscam/projects/SceneAug/default.log
#SBATCH --time=13-23:59:00
#SBATCH --ntasks=1
#SBATCH --gres=gpu:l40s:6
#SBATCH --mem=512G


cd $1
SESSION_NAME=0_test
tmux new-session -d -s $SESSION_NAME "sleep infinity"

# Keep the job running until tmux session finishes
while tmux has-session -t $SESSION_NAME 2>/dev/null; do
  sleep 10
done

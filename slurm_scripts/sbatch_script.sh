#!/bin/bash
#SBATCH --account=viscam
#SBATCH --partition=viscam
#SBATCH --job-name=pdb_debugging
#SBATCH --output=job_output.log
#SBATCH --error=job_error.log
#SBATCH --time=72:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4

# Load any necessary modules
#module load python

# Start a tmux session
tmux new-session -d -s debugsession "$1"

# Keep the job alive to allow reattachment
sleep infinity

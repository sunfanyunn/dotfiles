#!/bin/bash

# Get the latest job ID for the current user
#LATEST_JOB_ID=$(squeue -u $USER --noheader --format "%i" | sort -n | tail -n 1)
if [ -n "$1" ]; then
    LATEST_JOB_ID=$1
else
    # Get the latest job ID for the current user
    LATEST_JOB_ID=$(squeue -u $USER --noheader --format "%i" | sort -n | tail -n 1)
fi


# Check if a job ID was found
if [ -z "$LATEST_JOB_ID" ]; then
    echo "No jobs found for user $USER."
    exit 1
fi

# Attach to the latest job
echo "Attaching to job ID $LATEST_JOB_ID..."
srun --jobid=$LATEST_JOB_ID --pty bash

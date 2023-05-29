#!/bin/bash -ex
cat ./_bashrc >>  ~/.bashrc
cat ./_tmux.conf >> ~/.tmux.conf 
source ~/.bashrc
tmux source-file ~/.tmux.conf

#!/bin/sh
session="work"
tmux start-server
tmux new-session -d -s $session -n vim -x "$(tput cols)" -y "$(tput lines)"
tmux send-keys "v ." C-m
tmux splitw -v -p 15
tmux selectp -t 0
tmux attach-session -t $session

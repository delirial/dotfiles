#!/bin/bash
# Set Session Name
SESSION="Bash"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

# Only create tmux session if it doesn't already exist
if [ "$SESSIONEXISTS" = "" ]
then

tmux new-session -d -s $SESSION

WINDOW=0
tmux send-keys -t $SESSION:$WINDOW 'nvim ~/.bashrc' C-m
tmux rename-window -t $WINDOWS 'Config'

WINDOW=1
tmux new-window -t $SESSION:$WINDOW -n 'Tests'
fi
tmux attach-session -t $SESSION:0

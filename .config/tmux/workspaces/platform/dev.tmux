#!/bin/bash
# Set Session Name
SESSION="EdgePlatform"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

# Only create tmux session if it doesn't already exist
if [ "$SESSIONEXISTS" = "" ]
then

tmux new-session -d -s $SESSION

WINDOW=0
tmux send-keys -t $SESSION:$WINDOW 'cd 	~/code/edge-platform' C-m
tmux send-keys -t $SESSION:$WINDOW 'nvim .' C-m
tmux rename-window -t $WINDOW 'Main';

WINDOW=1
tmux new-window -t $SESSION:$WINDOW -n 'Runtime'
tmux send-keys -t $SESSION:$WINDOW 'cd ~/code/edge-platform/cloud-connectivity/cc-connector-runtime' C-m
fi

# Attach Session, on the Main window
tmux attach-session -t $SESSION:0

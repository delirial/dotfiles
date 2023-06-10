#!/bin/bash
# Set Session Name
SESSION="Authcli"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

# Only create tmux session if it doesn't already exist
if [ "$SESSIONEXISTS" = "" ]
then

tmux new-session -d -s $SESSION

WINDOW=0
tmux send-keys -t $SESSION:$WINDOW 'cd 	~/code/platform-authn-cli' C-m
tmux send-keys -t $SESSION:$WINDOW 'nvim .' C-m
tmux rename-window -t $WINDOW 'Golang';

WINDOW=1
tmux new-window -t $SESSION:$WINDOW -n 'Python'
tmux send-keys -t $SESSION:$WINDOW 'cd ~/code/platform-authn-utility' C-m
tmux send-keys -t $SESSION:$WINDOW 'nvim ./authTokenGenerator.py' C-m
fi

# Attach Session, on the Main window
tmux attach-session -t $SESSION:0

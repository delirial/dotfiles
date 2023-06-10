#!/bin/bash
# Set Session Name
SESSION="Nvim_Configuration"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

# Only create tmux session if it doesn't already exist
if [ "$SESSIONEXISTS" = "" ]
then

tmux new-session -d -s $SESSION

WINDOW=0
tmux send-keys -t $SESSION:$WINDOW 'cd ~/.config/nvim' C-m
tmux send-keys -t $SESSION:$WINDOW 'nvim .' C-m
tmux rename-window -t $WINDOWS 'Main';
fi
# Attach Session, on the Main window
tmux attach-session -t $SESSION:0

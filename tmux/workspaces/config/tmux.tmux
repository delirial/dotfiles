#!/bin/bash
# Set Session Name
SESSION="Tmux_configuration"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

# Only create tmux session if it doesn't already exist
if [ "$SESSIONEXISTS" = "" ]
then

tmux new-session -d -s $SESSION

WINDOW=0
tmux rename-window -t $WINDOWS 'Main';
tmux send-keys -t $SESSION:$WINDOW 'cd ~/.config/tmux' C-m
tmux send-keys -t $SESSION:$WINDOW 'nvim .' C-m
fi

# Attach Session, on the Main window
tmux attach-session -t $SESSION:0

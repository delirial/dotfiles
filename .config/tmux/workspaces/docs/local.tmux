#!/bin/bash
# Set Session Name
SESSION="docs"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

# Only create tmux session if it doesn't already exist
if [ "$SESSIONEXISTS" = "" ]
then

tmux new-session -d -s $SESSION

WINDOW=0
tmux send-keys -t $SESSION:$WINDOW 'cd ~/code/docs/docs/src/content/docs-edge-core-services' C-m
tmux send-keys -t $SESSION:$WINDOW 'nvim ./docs/getting-started.md' C-m
tmux rename-window -t $WINDOWS 'Content';

WINDOW=1
tmux new-window -t $SESSION:$WINDOW -n 'Server'
tmux send-keys -t $SESSION:$WINDOW 'cd ~/code/docs/docs/' C-m
tmux send-keys -t $SESSION:$WINDOW 'nvm use 18' C-m
tmux send-keys -t $SESSION:$WINDOW 'npm start' C-m
# Attach Session, on the Main window
fi
tmux attach-session -t $SESSION:0

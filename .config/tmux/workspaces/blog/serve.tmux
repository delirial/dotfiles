#!/bin/bash
# Set Session Name
SESSION="Blog"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

# Only create tmux session if it doesn't already exist
if [ "$SESSIONEXISTS" = "" ]
then

tmux new-session -d -s $SESSION

WINDOW=0
tmux send-keys -t $SESSION:$WINDOW 'cd ~/workspace/blog' C-m
tmux send-keys -t $SESSION:$WINDOW 'nvim .' C-m
tmux rename-window -t $WINDOWS 'Dev'

WINDOW=1
tmux new-window -t $SESSION:$WINDOW -n 'Server'
tmux send-keys -t $SESSION:$WINDOW 'cd ~/workspace/blog' C-m
tmux send-keys -t $SESSION:$WINDOW 'hugo serve' C-m
fi
tmux attach-session -t $SESSION:0

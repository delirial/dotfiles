#!/bin/bash
# Set Session Name
SESSION="Edgeproxy"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

# Only create tmux session if it doesn't already exist
if [ "$SESSIONEXISTS" = "" ]
then

tmux new-session -d -s $SESSION

WINDOW=0
tmux send-keys -t $SESSION:$WINDOW 'cd ~/code/edge-edgeproxy' C-m
tmux send-keys -t $SESSION:$WINDOW 'nvim .' C-m
tmux rename-window -t $WINDOWS 'Main';

WINDOW=1
tmux new-window -t $SESSION:$WINDOW -n 'Tests'
tmux send-keys -t $SESSION:$WINDOW 'cd ~/code/edge-edgeproxy/build' C-m
tmux split-window -h 
tmux send-keys -t $SESSION:$WINDOW 'cd ~/code/edge-edgeproxy/build' C-m
tmux send-keys -t $SESSION:$WINDOW './edgeproxy-linux-amd64 server -v' C-m
tmux split-window -v
tmux send-keys -t $SESSION:$WINDOW 'cd ~/code/edge-edgeproxy/build' C-m
fi

# Attach Session, on the Main window
tmux attach-session -t $SESSION:0

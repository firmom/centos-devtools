#!/bin/bash
if [ ! -f "$HOME/.ssh/id_rsa" ]; then
  ssh-keygen -f "$HOME/.ssh/id_rsa" -t rsa -N ''
fi

if [ -f "$HOME/Desktop/autorun.sh" ]; then
  chmod +x "$HOME/Desktop/autorun.sh"
  sh "$HOME/Desktop/autorun.sh"
fi

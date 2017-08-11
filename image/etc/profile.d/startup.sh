#!/bin/bash
if [ ! -f "$HOME/.ssh/id_rsa" ]; then
  mkdir -p "$HOME/.ssh"
  ssh-keygen -f "$HOME/.ssh/id_rsa" -t rsa -q -N ''
fi

if [echo "" -f "$HOME/Desktop/autorun.sh" ]; then
  chmod +x "$HOME/Desktop/autorun.sh"
  sh "$HOME/Desktop/autorun.sh"
fi

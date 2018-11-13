#!/bin/bash

xfce4-terminal \
  --tab --title beerpoly-home-backend \
  --command "bash -x $HOME/scripts/run-beerpoly-home-backend.sh" \
  --hold \
  \
  --tab --title beerpoly-home-frontend \
  --command "bash -x $HOME/scripts/run-beerpoly-home-frontend.sh" \
  --hold

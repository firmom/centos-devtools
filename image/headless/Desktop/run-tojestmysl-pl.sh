#!/bin/bash

xfce4-terminal \
  --tab --title tojestmysl-pl-backend \
  --command "bash -x $HOME/scripts/run-tojestmysl-pl-backend.sh" \
  --hold \
  \
  --tab --title tojestmysl-pl-frontend \
  --command "bash -x $HOME/scripts/run-tojestmysl-pl-frontend.sh" \
  --hold

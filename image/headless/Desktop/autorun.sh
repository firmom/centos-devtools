#!/bin/bash

if [ ! -f "$HOME/.ssh/id_rsa" ]; then
  mkdir -p "$HOME/.ssh"
  ssh-keygen -f "$HOME/.ssh/id_rsa" -t rsa -q -N ''
fi

# You can your own startup code at /headless/Desktop/work/autorun.sh
# The file is persist and will run every centos-devtools restart.
#
# You can use it to:
#
# 1. And add your mount network drives. For example:
#   mkdir "$HOME/Desktop/shared"
#   mount -t cifs -o username=<share user>,password=<share password> //MACHINE_IP/<share name> "$HOME/Desktop/shared"
#
# 2. Load you custom project.
#   Like in https://github.com/firmom/centos-devtools/blob/master/image/dockerstartup/firmom.sh
#
# 3. Add something else
#   "The only limit to your impact is your imagination and commitment." - Tony Robbins


# sky is the limit

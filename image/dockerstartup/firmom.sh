#!/bin/bash
set -e

mkdir -p /headless/go/src/github.com/goatcms/
mkdir -p /headless/go/src/github.com/firmom/
mkdir -p /headless/go/src/github.com/GameInPL/

if [ ! -d "/headless/Desktop/work/goatcms/goatcms" ]; then
  git clone "https://github.com/goatcms/goatcms" "/headless/Desktop/work/goatcms/goatcms"
  ln -s /headless/Desktop/work/goatcms/goatcms /headless/go/src/github.com/goatcms/goatcms
fi

if [ ! -d "/headless/Desktop/work/goatcms/goatcli" ]; then
  git clone "https://github.com/goatcms/goatcli" "/headless/Desktop/work/goatcms/goatcli"
  ln -s /headless/Desktop/work/goatcms/goatcli /headless/go/src/github.com/goatcms/goatcli
fi

if [ ! -d "/headless/Desktop/work/goatcms/webslots" ]; then
  git clone "https://github.com/goatcms/webslots" "/headless/Desktop/work/goatcms/webslots"
  ln -s /headless/Desktop/work/goatcms/webslots /headless/go/src/github.com/goatcms/webslots
fi

if [ ! -d "/headless/Desktop/work/goatcms/goatcore" ]; then
  git clone "https://github.com/goatcms/goatcore" "/headless/Desktop/work/goatcms/goatcore"
  ln -s /headless/Desktop/work/goatcms/goatcore /headless/go/src/github.com/goatcms/goatcore
fi

if [ ! -d "/headless/Desktop/work/goatcms/emptyapp" ]; then
  git clone "https://github.com/goatcms/emptyapp" "/headless/Desktop/work/goatcms/emptyapp"
  ln -s /headless/Desktop/work/goatcms/emptyapp /headless/go/src/github.com/goatcms/emptyapp
fi

if [ ! -d "/headless/Desktop/work/gameinpl/beerpoly-home" ]; then
  git clone "https://github.com/GameInPL/beerpoly-home" "/headless/Desktop/work/gameinpl/beerpoly-home"
  ln -s /headless/Desktop/work/gameinpl/beerpoly-home /headless/go/src/github.com/GameInPL/beerpoly-home
fi

if [ ! -d "/headless/Desktop/work/gameinpl/beerpoly" ]; then
  git clone "https://github.com/GameInPL/beerpoly" "/headless/Desktop/work/gameinpl/beerpoly"
  ln -s /headless/Desktop/work/gameinpl/beerpoly /headless/go/src/github.com/GameInPL/beerpoly
fi

if [ ! -d "/headless/Desktop/work/firmom/centos-devtools" ]; then
  git clone "https://github.com/firmom/centos-devtools" "/headless/Desktop/work/firmom/centos-devtools"
  ln -s /headless/Desktop/work/firmom/centos-devtools /headless/go/src/github.com/firmom/centos-devtools
fi

if [ ! -d "/headless/Desktop/work/firmom/cicd" ]; then
  git clone "https://github.com/firmom/cicd" "/headless/Desktop/work/firmom/cicd"
  ln -s /headless/Desktop/work/firmom/cicd /headless/go/src/github.com/firmom/cicd
fi

# Define git user
git config --global user.email "$GIT_USER_EMAIL"
git config --global user.name "$GIT_USER_NAME"

# Run autorun files
if [ -f "/headless/Desktop/autorun.sh" ]; then
  sh "/headless/Desktop/autorun.sh"
fi

# prepare Desktop autorun script (if the script doesn't exist)
if [ ! -f "/headless/Desktop/autorun.sh" ]; then
cat > /headless/Desktop/work/autorun.sh << EndOfMessage
#!/bin/sh

# Add your custom code to run here
# ...
EndOfMessage
fi

if [ -f "/headless/Desktop/work/autorun.sh" ]; then
  sh "/headless/Desktop/work/autorun.sh"
fi

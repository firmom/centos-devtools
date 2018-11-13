#!/bin/bash
set -e

mkdir -p /headless/go/src/github.com/goatcms/
mkdir -p /headless/go/src/github.com/firmom/
mkdir -p /headless/go/src/github.com/gameinpl/
mkdir -p /headless/go/src/github.com/sebastianpozoga/

if [ ! -d "/headless/Desktop/work/goatcms/goatcms" ]; then
  git clone "https://github.com/goatcms/goatcms" "/headless/Desktop/work/goatcms/goatcms"
fi
if [ ! -e "/headless/go/src/github.com/goatcms/goatcms" ]; then
  ln -s /headless/Desktop/work/goatcms/goatcms /headless/go/src/github.com/goatcms/goatcms
fi

if [ ! -d "/headless/Desktop/work/goatcms/goatcli" ]; then
  git clone "https://github.com/goatcms/goatcli" "/headless/Desktop/work/goatcms/goatcli"
fi
if [ ! -e "/headless/go/src/github.com/goatcms/goatcli" ]; then
  ln -s /headless/Desktop/work/goatcms/goatcli /headless/go/src/github.com/goatcms/goatcli
fi

if [ ! -d "/headless/Desktop/work/goatcms/webslots" ]; then
  git clone "https://github.com/goatcms/webslots" "/headless/Desktop/work/goatcms/webslots"
fi
if [ ! -e "/headless/go/src/github.com/goatcms/webslots" ]; then
  ln -s /headless/Desktop/work/goatcms/webslots /headless/go/src/github.com/goatcms/webslots
fi

if [ ! -d "/headless/Desktop/work/goatcms/goatcore" ]; then
  git clone "https://github.com/goatcms/goatcore" "/headless/Desktop/work/goatcms/goatcore"
fi
if [ ! -e "/headless/go/src/github.com/goatcms/goatcore" ]; then
  ln -s /headless/Desktop/work/goatcms/goatcore /headless/go/src/github.com/goatcms/goatcore
fi

if [ ! -d "/headless/Desktop/work/goatcms/emptyapp" ]; then
  git clone "https://github.com/goatcms/emptyapp" "/headless/Desktop/work/goatcms/emptyapp"
fi
if [ ! -e "/headless/go/src/github.com/goatcms/emptyapp" ]; then
  ln -s /headless/Desktop/work/goatcms/emptyapp /headless/go/src/github.com/goatcms/emptyapp
fi

if [ ! -d "/headless/Desktop/work/gameinpl/beerpoly-home" ]; then
  git clone "https://github.com/gameinpl/beerpoly-home" "/headless/Desktop/work/gameinpl/beerpoly-home"

fi
if [ ! -e "/headless/go/src/github.com/gameinpl/beerpoly-home" ]; then
  ln -s /headless/Desktop/work/gameinpl/beerpoly-home /headless/go/src/github.com/gameinpl/beerpoly-home
fi

if [ ! -d "/headless/Desktop/work/gameinpl/beerpoly" ]; then
  git clone "https://github.com/gameinpl/beerpoly" "/headless/Desktop/work/gameinpl/beerpoly"
fi
if [ ! -e "/headless/go/src/github.com/gameinpl/beerpoly" ]; then
  ln -s /headless/Desktop/work/gameinpl/beerpoly /headless/go/src/github.com/gameinpl/beerpoly
fi

if [ ! -d "/headless/Desktop/work/firmom/centos-devtools" ]; then
  git clone "https://github.com/firmom/centos-devtools" "/headless/Desktop/work/firmom/centos-devtools"
fi

if [ ! -d "/headless/Desktop/work/firmom/cicd" ]; then
  git clone "https://github.com/firmom/cicd" "/headless/Desktop/work/firmom/cicd"
fi

if [ ! -d "/headless/Desktop/work/sebastianpozoga/events.pozoga.eu" ]; then
  git clone "https://github.com/sebastianpozoga/events.pozoga.eu" "/headless/Desktop/work/sebastianpozoga/events.pozoga.eu"
fi

if [ ! -d "/headless/Desktop/work/sebastianpozoga/docker-cleaner" ]; then
  git clone "https://github.com/sebastianpozoga/docker-cleaner" "/headless/Desktop/work/sebastianpozoga/docker-cleaner"
fi

# Define git user
git config --global user.email "$GIT_USER_EMAIL"
git config --global user.name "$GIT_USER_NAME"

# Run autorun files
if [ -f "/headless/Desktop/autorun.sh" ]; then
  sh "/headless/Desktop/autorun.sh"
fi

# prepare Desktop autorun script (if the script doesn't exist)
if [ ! -f "/headless/Desktop/work/autorun.sh" ]; then
cat > /headless/Desktop/work/autorun.sh << EndOfMessage
#!/bin/bash

# Add your custom code to run here
# ...
EndOfMessage
fi

if [ -f "/headless/Desktop/work/autorun.sh" ]; then
  sh "/headless/Desktop/work/autorun.sh"
fi

#!/bin/bash

cd $HOME/go/src/github.com/gameinpl/beerpoly-home

cat > $HOME/go/src/github.com/gameinpl/beerpoly-home/.goat/secrets.json << EndOfMessage
{
  "database": {
    "engine": "sqlite",
    "host": "",
    "name": "",
    "password": "",
    "username": ""
  },
  "oauth": {
    "github": {
      "app": "a",
      "secret": "a"
    }
  },
  "smtp": {
    "address": "$SMTP_SERVER",
    "user": "$SMTP_USERNAME",
    "password": "$SMTP_PASSWORD",
    "identity": ""
  },
  "router.security.mode": "HTTP"
}
EndOfMessage

rm -rf translates
goatcli build
dep ensure
go run ./main.go run --host=:80 --env=dev

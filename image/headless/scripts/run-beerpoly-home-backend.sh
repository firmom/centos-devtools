#!/bin/bash

cd $HOME/go/src/github.com/gameinpl/beerpoly-home

goatcli build
dep ensure
go run ./main.go --env=dev

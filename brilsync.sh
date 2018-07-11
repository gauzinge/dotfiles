#!/bin/bash

alias bpull='rsync -avrPh --delete --update --exclude=daq/xaas/ --exclude=.git gauzinge@cmsusr:~/brildaq/ ~/cernbox/workspace/brildaq'
alias bpush='rsync -avrPh --delete --update --exclude=daq/xaas/ --exclude=.git ~/cernbox/workspace/brildaq/ gauzinge@cmsusr:~/brildaq '

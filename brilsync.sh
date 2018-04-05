#!/bin/bash

alias bpull='rsync -avrPh --delete --update --exclude=daq/xaas/ gauzinge@cmsusr:~/brildaq/ ~/cernbox/workspace/brildaq'
alias bpush='rsync -avrPh --delete --update --exclude=daq/xaas/ ~/cernbox/workspace/brildaq/ gauzinge@cmsusr:~/brildaq '

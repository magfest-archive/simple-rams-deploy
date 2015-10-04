#!/bin/bash

EVENT_NAME=test

set -e

cd ~/uber/puppet/
cat fabric_settings.example.ini > fabric_settings.ini
./setup_vagrant_control_server.sh $EVENT_NAME

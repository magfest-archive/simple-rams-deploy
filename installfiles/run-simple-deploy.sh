#!/bin/bash

EVENT_NAME=magstock

set -e

cd ~/uber/puppet/
{ cat fabric_settings.example.ini; echo -en "\ngit_regular_nodes_repo = 'https://github.com/magfest/production-config'"; } > fabric_settings.ini
./setup_vagrant_control_server.sh $EVENT_NAME

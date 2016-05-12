#!/bin/bash
set -e

if [[ $# -eq 0 ]] ; then
  echo "usage: $0 [event_name]"
  exit -1
fi

EVENT_NAME=$1

cd ~/uber/puppet/
{ cat fabric_settings.example.ini; echo -en "\ngit_regular_nodes_repo = 'https://github.com/magfest/production-config'"; } > fabric_settings.ini
./setup_vagrant_control_server.sh $EVENT_NAME

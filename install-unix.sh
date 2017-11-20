#!/bin/bash

# fail on any errors
set -e

# output all stderr and stdout to a logfile, and to the screen as well
logfile=install.log
exec &> >(tee -a "$logfile")

echo -en "\n-------------------------\nUbersystem Installer\n-------------------------\n\n"

# read list of valid event names from external file
IFS=$'\r\n' GLOBIGNORE='*' command eval  'valid_eventnames=($(cat valid_eventnames.txt))'

function usage() {
  echo "Usage: $0 [event_name]"
  echo ""
  echo "     event_name can be one of the following: ${valid_eventnames[*]}"
}

function array_contains() {
    local array="$1[@]"
    local seeking=$2
    local in=1
    for element in "${!array}"; do
        if [[ $element == $seeking ]]; then
            in=0
            break
        fi
    done
    return $in
}

if [ -z "$1" ]; then
  echo "ERROR: you must specify which event you want to deploy."
  usage
  exit -1
fi
event_name=$1

array_contains valid_eventnames $event_name && valid_event=1 || valid_event=0
if [ ${valid_event} -eq 0 ]; then
  echo "ERROR: $event_name is not a valid event name."
  usage
  exit -1
fi

if [ -d "ubersystem-deploy" ]; then
  echo "
ERROR: Aborting: directory 'ubersystem-deploy' already exists, do you have a previous installation?

To uninstall a previous installation, please run the following commands (WARNING, THIS WILL DESTROY ALL PREVIOUSLY INSTALLED CODE/DATA)
  cd ubersystem-deploy/
  vagrant destroy       # ignore any errors you see here
  cd ..
  rm -rf ubersystem-deploy/"
  exit -1
fi

function install_vagrant() {
    echo "installing for event_name=$event_name"
    echo "If you have any issues, please send your install.log to code@magfest.org"

    local event_name=$1
    local vm_cmd="cd ~/uber/ && ./run-simple-deploy.sh $event_name && rm -f ./run-simple-deploy.sh"

    git clone https://github.com/magfest/ubersystem-deploy
    cd ubersystem-deploy
    vagrant up
    cp ../installfiles/run-simple-deploy.sh .
    vagrant ssh -c "$vm_cmd"
}

function post_install() {
    # not sure how / if we should do this on *nix
    # on windows, can do 'start http://localhost:8000/uber/accounts/insert_test_admin' to open web browser

    testadminString="Create your test user at http://localhost:8000/uber/accounts/insert_test_admin"

    case "$OSTYPE" in
      darwin*)  open "http://localhost:8000/uber/accounts/insert_test_admin"  ;;
      solaris*) echo $testadminString ;;
      linux*)   echo $testadminString ;;
      bsd*)     echo $testadminString ;;
      *)        echo $testadminString ;;
    esac
}

install_vagrant ${event_name} && install_success=1
post_install

echo "-------------------------------- INSTALLATION ENDED --------------------------"

#!/bin/bash

# fail on any errors
set -e

# read list of valid event names from external file
IFS=$'\r\n' GLOBIGNORE='*' command eval  'valid_eventnames=($(cat valid_eventnames.txt))'

function usage() {
  echo ubersystem deployment setup. ERROR: you must specify which event you want to deploy:
  echo event_name can be one of the following: ${valid_eventnames[*]}
  echo usage: $0 [event_name]
}

array_contains () { 
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
  usage
  exit -1
fi

array_contains valid_eventnames $1 && valid_event=1 || valid_event=0
if [ $valid_event -eq 0 ]; then 
  usage
  exit -1
fi

# ----------------------------------------
# meat starts here
# ----------------------------------------
echo installling event_name=$1

vm_cmd="cd ~/uber/ && ./run-simple-deploy.sh $1 && rm -f ./run-simple-deploy.sh"
test -d ubersystem-deploy || git clone https://github.com/magfest/ubersystem-deploy
cd ubersystem-deploy
vagrant up
cp ../installfiles/run-simple-deploy.sh .
vagrant ssh -c "$vm_cmd"

# not sure how / if we should do this on *nix
# start http://localhost:8000/uber/accounts/insert_test_admin

testadminString="Create your test user at http://localhost:8000/uber/accounts/insert_test_admin"

case "$OSTYPE" in
  darwin*)  open "http://localhost:8000/uber/accounts/insert_test_admin"  ;; 
  solaris*) echo $testadminString ;;
  linux*)   echo $testadminString ;;
  bsd*)     echo $testadminString ;;
  *)        echo $testadminString ;;
esac

echo "deploy should be finished"

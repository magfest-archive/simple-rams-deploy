#!/bin/bash

# fail on any errors
set -e

git clone https://github.com/magfest/ubersystem-deploy
cd ubersystem-deploy
vagrant up
cp ../installfiles/run-simple-deploy.sh .
vagrant ssh -c 'cd ~/uber/ && ./run-simple-deploy.sh && rm -f ./run-simple-deploy.sh'

# not sure how / if we should do this on *nix
# start http://localhost:8000/uber/accounts/insert_test_admin

echo "deploy should be finished"

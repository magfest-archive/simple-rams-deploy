git clone https://github.com/magfest/ubersystem-deploy

cd ubersystem-deploy
cp puppet/fabric_settings.example.ini puppet/fabric_settings.ini

( echo " " & echo. & echo "git_regular_nodes_repo = 'https://github.com/magfest/production-config'" ) >> puppet/fabric_settings.ini

vagrant up

vagrant ssh -c 'cd ~/uber/puppet/ && ./setup_vagrant_control_server.sh prime'

start http://localhost:8000/uber/accounts/insert_test_admin

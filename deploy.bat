git clone https://github.com/magfest/ubersystem-deploy

cd ubersystem-deploy
copy puppet\fabric_settings.example.ini puppet\fabric_settings.ini

vagrant up

vagrant ssh -c 'cd ~/uber/puppet/ && { cat fabric_settings.example.ini; echo -en "\ngit_regular_nodes_repo = 'https://github.com/magfest/production-config'";  } > fabric_settings.ini && ./setup_vagrant_control_server.sh prime'

start http://localhost:8000/uber/accounts/insert_test_admin

pause

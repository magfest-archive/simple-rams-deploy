# Ultra-simple Magfest Prime deploy

## Prerequisites
Install all this stuff:
* [Git](http://git-scm.com/) to check out this repo and to provide SSH.
* [VirtualBox](https://www.virtualbox.org/wiki/Downloads) for running your development VM.
* [Vagrant](http://www.vagrantup.com/downloads.html) itself.

You must have read access to http://github.com/magfest/production-config - if you get a 404 when you click that link, this won't work.

## before you begin

advanced: If you have previous deployments, you must ensure those VMs are stopped.  Either type 'vagrant halt', or open the Virtualbox program from the start menu and power off any running VMs

## Install instructions

1. clone this repo.
2. double click deploy.bat
3. about 3 minutes in, type in your github user/password
4. after the deploy is finished, it will open a web browser, login with username 'magfest@example.com' and password 'magfest'
5. type 'vagrant ssh' to access the running machine
  


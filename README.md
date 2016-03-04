# Magfest Prime deploy

This is the officially supported method of setting up a development environment for Magfest's ubersystem.  It will get you a deployment config that is using the same plugins, and nearly the same configuration, as our production servers.

## Prerequisites
Install all this stuff:
* [Git](http://git-scm.com/) to check out this repo and to provide SSH.
* [VirtualBox](https://www.virtualbox.org/wiki/Downloads) for running your development VM.
* [Vagrant](http://www.vagrantup.com/downloads.html) itself.

It's recommended that you have a fast internet connection, at least 4gb of RAM, and a fast PC for this.

## Install instructions (Windows)

1. clone this repo.
2. run install-windows.bat by double clicking it, or from the command prompt
3. after the deploy is finished, it will open a web browser, login with username 'magfest@example.com' and password 'magfest'

## Install instructions (Linux/Mac/Cygwin/MingW)

1. clone this repo.
2. run ```./install-unix.sh``` from the terminal
3. after the deploy is finished, open a web browser to http://localhost:8000/uber/accounts/insert_test_admin
4. login with username 'magfest@example.com' and password 'magfest'

## To SSH into the machine

1. ```cd ubersystem-deploy```
2. type ```vagrant ssh``` to access the running machine

Now that things are fully installed, check out the docs here for more info on what to do next: 
https://github.com/magfest/ubersystem-deploy/blob/master/DEVELOPING.md
  
## Troubleshooting

If you have previous deployments, you must ensure those VMs are stopped.  Either type 'vagrant halt', or open the 
Virtualbox program from the start menu and power off any running VMs

If you see any Virtualbox errors when starting the process about 'VMX' or 'hardware acceleration', you need to make sure 
that hardware virtualization acceleration / extensions is enabled in your computer's BIOS.

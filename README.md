# Magfest ubersystem simple deploy

This is the officially supported method of setting up a development environment for Magfest's ubersystem.  It will get you a deployment config that is using the same plugins, and nearly identical configuration, as our production servers.  Once deployed,
you can run a command to update all repositories to the latest changes from github.

## Getting started

First, install all this stuff:
* [Git](http://git-scm.com/) to check out this repo and to provide SSH.
* [VirtualBox](https://www.virtualbox.org/wiki/Downloads) for running your development VM.
* [Vagrant](http://www.vagrantup.com/downloads.html) itself.

It's recommended that you have a fast internet connection, at least 4gb of RAM, and a fast PC for this.

## Choose an event

This deploy supports multiple events with different configuration.  Pick an event from [the list of valid events](https://github.com/magfest/simple-rams-deploy/blob/master/valid_eventnames.txt) (examples: 'magstock', 'labs', 'prime')

## Install instructions (Windows)

1. clone this repository somewhere [Instructions](https://help.github.com/articles/cloning-a-repository/)
2. open a command prompt and change directories to the location of the repository
3. type ```install-windows.bat insert-your-event-name-here``` from the terminal.  For example, to install magstock, you would type: ```install-windows.bat magstock```
4. after the deploy is finished, it will open a web browser, login with username 'magfest@example.com' and password 'magfest'.  If that doesn't work for any reason, just browse to http://localhost:8000/uber/accounts/insert_test_admin

## Install instructions (Linux/Mac/Cygwin/MingW)

1. clone this repository somewhere [Instructions](https://help.github.com/articles/cloning-a-repository/)
2. type ```./install-unix.sh insert-your-event-name-here``` from the terminal.  
   For example, to install magstock, you would type: ```./install-unix.sh magstock```
3. after the deploy is finished, go open a web browser to http://localhost:8000/uber/accounts/insert_test_admin
4. now you can login with username 'magfest@example.com' and password 'magfest'

## To SSH into the machine

1. ```cd ubersystem-deploy```
2. type ```vagrant ssh``` to access the running machine

Now that things are fully installed, check out the docs here for more info on what to do next: 
https://github.com/magfest/ubersystem-deploy/blob/master/DEVELOPING.md
  
## Troubleshooting

* If you have previous deployments, you must ensure those VMs are stopped.  Either type 'vagrant halt' from their ubersystem-deploy directories, or open the  Virtualbox program from the start menu and power off any running VMs

* If you see any Virtualbox errors like 'unable to start virtual machine' when starting the process, or anything about 'VMX' or 'hardware acceleration', you may need to make sure that [hardware virtualization acceleration / extensions is enabled](https://www.google.com/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8#q=virtualbox%20vtx%20disabled%20in%20bios) in your computer's BIOS.

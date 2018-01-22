# Magfest ubersystem simple deploy 

This is the officially supported method of setting up a development environment for Magfest's ubersystem.  It will get you a deployment config that is using the same plugins, and nearly identical configuration, as our production servers.  Once deployed,
you can run a command to update all repositories to the latest changes from github.

## Getting started

First, install all this stuff:
* [Git](http://git-scm.com/)
* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [Vagrant](http://www.vagrantup.com/downloads.html)

It's recommended that you have a fast internet connection, at least 4gb of RAM, and a fast PC for this.

## Choose an event and a year

This deploy supports multiple events with different configuration.  Pick an event/year combo from [the list of valid combinations](https://github.com/magfest/simple-rams-deploy/blob/master/valid_eventname_year_combos.txt) (examples: 'magstock 2018', 'labs 2018', 'prime 2019')

## Windows-specific setup

1. open a git BASH terminal by clicking Start menu and typing 'git bash'.  You should see a black  command prompt window with green text.

2. clone this repository (this repository is named 'simple-rams-deploy') somewhere on your local computer.
   You can do this by opening a command prompt and running the following commands:
   ```
   cd C:\wherever\you\want\your\project\to\live\
   
   git clone https://github.com/magfest/simple-rams-deploy
   
   cd simple-rams-deploy
   ```
   ([More Instructions](https://help.github.com/articles/cloning-a-repository/) if you need them)
   
3. Follow the section named 'Common Instructions' below.

##  Linux/Mac instructions

1. clone this repository (this repository is named 'simple-rams-deploy') somewhere on your local computer.
   You can do this by opening a command prompt and running the following commands:
   ```
   cd /home/myusername/somewhere/
   
   git clone https://github.com/magfest/simple-rams-deploy
   
   cd simple-rams-deploy
   ```
   ([More Instructions](https://help.github.com/articles/cloning-a-repository/) if you need them)

2. Follow the section named 'Common Instructions' below.

## Common instructions (Windows/Linux/Mac/Cygwin/MingW)

1. type ```./install-unix.sh desired_event_name desired_event_year``` from the terminal.
   For example, to install magstock, you would type: ```./install-unix.sh magstock 2018```
2. after the deploy is finished, open a web browser to ```http://localhost:8000/uber/accounts/insert_test_admin```. This will create a default username/password
3. now you can login to ubersystem with username 'magfest@example.com' and password 'magfest'

Installation complete!

## To SSH into the machine

1. ```cd ubersystem-deploy```
2. type ```vagrant ssh``` to access the running machine

Now that things are fully installed, check out the docs here for more info on what to do next: 
https://github.com/magfest/ubersystem-deploy/blob/master/DEVELOPING.md

## Setup PyCharm For Debugging
1. Configure your remote interpreter for Vagrant by going to Preferences
2. Under Project->Project Interpreter add a Remote Interpreter
3. Select Vagrant and put your python path as ```/home/vagrant/uber/sideboard/env/bin/python```
4. Edit your configurations
5. Add a python interpreter, and name it sideboard if you'd like
6. Set the script to one located at ```/simple-rams-deploy/ubersystem-deploy/sideboard/sideboard/run_server.py```
7. Select your python interpreter as Python 3.4.3
8. Set your working directory as ```/simple-rams-deploy/ubersystem-deploy/sideboard/sideboard```
9. You should be able to run uber from Pycharm now! Good luck!
  
## Troubleshooting

* If you have previous deployments, you must ensure those VMs are stopped.  Either type 'vagrant halt' from their ubersystem-deploy directories, or open the  Virtualbox program from the start menu and power off any running VMs

* If you see any Virtualbox errors like 'unable to start virtual machine' when starting the process, or anything about 'VMX' or 'hardware acceleration', you may need to make sure that [hardware virtualization acceleration / extensions is enabled](https://www.google.com/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8#q=virtualbox%20vtx%20disabled%20in%20bios) in your computer's BIOS.

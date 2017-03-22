#!/bin/bash
cd ~/vagrant/$1/ && vagrant up
i3-msg "exec google-chrome-stable http://$1.local/"
sshfs vagrant@$1.local:/var/www/$1.local ~/mnt/ssh/$1
termite --class 'Termite-work' -d ~/mnt/ssh/$1/sites/all/modules/custom/ &
vagrant ssh -- -t "cd /var/www/$1.local/; /bin/bash"

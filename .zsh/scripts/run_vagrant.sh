#!/bin/bash
cd ~/vagrant/$1/ && vagrant up
sshfs vagrant@$1.local:/var/www/$1.local ~/mnt/ssh/$1
vagrant ssh -- -t "cd /var/www/$1.local/; /bin/bash"

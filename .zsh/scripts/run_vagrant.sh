#!/bin/bash
cd ~/vagrant/$1/ && vagrant up && vagrant ssh -- -t "cd /var/www/$1.local/; /bin/bash"
sshfs vagrant@$1.local:/var/www/$1.local ~/mnt/ssh/$1

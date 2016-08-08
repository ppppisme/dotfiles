#!/bin/bash
cd ~/vagrant/$1/ && vagrant up && vagrant ssh -- -t "cd /var/www/$1.local/; /bin/bash"

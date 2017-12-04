#!/bin/bash
cd ~/vagrant/$1/ && vagrant up
sleep 5
i3-msg "exec qutebrowser http://$1.local/"
termite --class 'Termite-work' -d ~/vagrant/$1/drupal/ &
vagrant ssh -- -t "cd /var/www/drupalvm/drupal; /bin/bash"

#!/bin/bash
sudo -i -u user sh -c 'cd; tmux new-session "sudo -i /usr/bin/supervisord -c /etc/supervisor/supervisord.conf" \;  split-window "bash"'

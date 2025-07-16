#!/bin/bash

# For DNS resolve in chroot env
cp /etc/resolv.conf /var/spool/postfix/etc/

# Start postfix with foreground mode
postfix start-fg
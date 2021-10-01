#!/bin/sh

# If there is some public key in keys folder
# then it copies its contain in authorized_keys file
if [ "$(ls -A /git-server/keys/)" ]; then
  cd /home/git
  sed 's/^/restrict /' /git-server/keys/*.pub > .ssh/authorized_keys
  chown -R git:git .ssh
  chmod 700 .ssh
  chmod 600 .ssh/*
fi

ssh-keygen -A 

exec /usr/sbin/sshd -D 

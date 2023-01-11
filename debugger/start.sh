#!/bin/bash

ssh-keygen -P "" -t rsa -f /home/roger/.ssh/ssh_host_rsa_key
ssh-keygen -P "" -t ecdsa -f /home/roger/.ssh/ssh_host_ecdsa_key
ssh-keygen -P "" -t ed25519 -f /home/roger/.ssh/ssh_host_ed25519_key


/usr/sbin/sshd -f /sshd_config &  
sleep 9h


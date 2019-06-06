#!/bin/bash

ssh-keygen -A  && /usr/sbin/sshd


exec $@

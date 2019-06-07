#!/bin/bash

#
#
echo "Rotina de preprocessamento"
echo
#
# Pre-processing steps:


ssh-keygen -A  && /usr/sbin/sshd

export JAVA_HOME=$(readlink -f $(which java))

#
#
echo "Iniciando aplicação"
echo
echo "Command:"
echo $@


exec $@


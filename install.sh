#!/bin/bash

# mongodb-org-3.2.repo
cp -a ${0##*/}/mongodb-org-3.2.repo /etc/yum.repos.d/mongodb-org-3.2.repo || exit $?

# yum
yum install -y 'mongodb-org-3.2.*' || exit $?

# service
service mongod restart || exit $?
chkconfig mongod on || exit $?

exit

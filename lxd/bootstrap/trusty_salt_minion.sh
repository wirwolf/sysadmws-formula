#!/bin/bash

/usr/bin/apt-get -qy -o 'DPkg::Options::=--force-confold' -o 'DPkg::Options::=--force-confdef' install wget
echo "deb http://archive.repo.saltstack.com/apt/ubuntu/$(lsb_release -sr)/amd64/$2 $(lsb_release -sc) main">> /etc/apt/sources.list.d/saltstack.list
/usr/bin/wget -qO - https://archive.repo.saltstack.com/apt/ubuntu/$(lsb_release -sr)/amd64/$2/SALTSTACK-GPG-KEY.pub | apt-key add -

[[ -d /home/ubuntu ]] && /usr/sbin/userdel -r "ubuntu"

/usr/bin/apt-get update
/usr/bin/apt-get -qy -o 'DPkg::Options::=--force-confold' -o 'DPkg::Options::=--force-confdef' upgrade
/usr/bin/apt-get -qy -o 'DPkg::Options::=--force-confold' -o 'DPkg::Options::=--force-confdef' dist-upgrade

/usr/bin/apt-get -qy -o 'DPkg::Options::=--force-confold' -o 'DPkg::Options::=--force-confdef' install salt-minion
/bin/rm -f /etc/salt/minion_id
/bin/cp /etc/hostname /etc/salt/minion_id
echo "fqdn: $(cat /etc/salt/minion_id)" >> /etc/salt/grains
/bin/sed -i.bak -e "s/#master: salt/master:\n  - $1/" /etc/salt/minion
/usr/sbin/service salt-minion restart

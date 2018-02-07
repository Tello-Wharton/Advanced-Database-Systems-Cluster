#!/bin/bash

route add default netmask 255.255.255.0 gw 10.211.55.1

cp /vagrant/resources/hosts /etc/hosts
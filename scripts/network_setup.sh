#!/bin/bash

#route add default netmask 255.255.255.0 gw 10.211.55.1

iptables -t nat -A PREROUTING -d 10.211.54.200 -j DNAT --to-destination 10.211.55.200
#iptables -t nat -A POSTROUTING -s 10.211.55.200 -j SNAT --to-source 10.211.54.200

cp /vagrant/resources/hosts /etc/hosts
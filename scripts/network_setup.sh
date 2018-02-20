#!/bin/bash

iptables -t nat -A PREROUTING -d 10.211.54.200 -j DNAT --to-destination 10.211.55.200

cp /vagrant/resources/hosts /etc/hosts
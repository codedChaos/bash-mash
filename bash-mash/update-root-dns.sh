#!/bin/bash
# update root hints from internet DNS

sudo mv /etc/bind/db.root /etc/bind/db.root_old
sudo wget -q -O /etc/bind/db.root https://www.internic.net/zones/named.root
sudo rndc reload

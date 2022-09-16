#!/bin/bash
# SPDX-license-identifier: Apache-2.0
##############################################################################
# Copyright (c) 2018
# All rights reserved. This program and the accompanying materials
# are made available under the terms of the Apache License, Version 2.0
# which accompanies this distribution, and is available at
# http://www.apache.org/licenses/LICENSE-2.0
##############################################################################

cat <<EOF | sudo tee /etc/netplan/01-netcfg.yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    eth0:
      dhcp4: true
      dhcp6: false
      optional: true
      nameservers:
        addresses: []
EOF
sudo netplan generate
sudo systemctl restart systemd-networkd.service
sudo systemctl restart ifplugd.service

cat <<EOF | sudo tee /etc/systemd/resolved.conf
[Resolve]
DNS=
FallbackDNS=
Domains=
#LLMNR=no
#MulticastDNS=no
DNSSEC=no
Cache=no
DNSStubListener=yes
EOF
sudo systemctl daemon-reload
sudo systemctl restart systemd-resolved
sudo mkdir -p /etc/systemd/resolved.conf.d
cat <<EOF | sudo tee /etc/systemd/resolved.conf.d/dns_servers.conf
[Resolve]
DNS=192.168.121.1
EOF
sudo systemctl daemon-reload
sudo systemctl restart systemd-resolved
sudo resolvectl status
sudo nslookup google.com

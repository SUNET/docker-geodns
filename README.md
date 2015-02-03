docker-geodns
=============

A docker image for running geodns. Installs from github/leifj/geodns fork of https://github.com/abh/geodns baseline.

Exposes port 53 and 8053 (monitor). Mount volume /etc/geodns and generate a json zonefile in /etc/geodns/dns/geodns.conf

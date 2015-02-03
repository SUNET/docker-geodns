docker-geodns
=============

A docker image for running geodns. Installs from leifj/geodns fork of abh/geodns baseline. Exposes port 53 and 8053 (monitor). Mount volume /etc/geodns and generate a json zonefile in /etc/geodns/dns. Changes are picked up automatically.

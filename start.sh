#!/bin/bash -x

if [ "x$DNSDIR" = "x" ]; then
   DNSDIR="/etc/geodns"
fi
mkdir -p $DNSDIR/dns && cd $DNSDIR && /opt/geodns/bin/geodns "$@"

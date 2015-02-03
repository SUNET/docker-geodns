#!/bin/bash

if [ "x$DNSDIR" = "x" ]; then
   DNSDIR="/opt/dns"
fi

mkdir -p $DNSDIR/dns
cd $DNSDIR
/opt/geodns/bin/geodns -http="127.0.0.1:8053"

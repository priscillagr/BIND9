#!/bin/bash
# Adiciona a entrada HOSTNAME e IP no servidor BIND9. $1 aguarda o hostanme e $2 aguarda o IP. Sera preenchido pelo formulario do vRO.
# $1 é o hostname, $2 é o endereço IP, $3 é o servidor DNS e $4 é a zona DNS.

echo "server $3" > /tmp/nsupdate
echo "debug yes" >> /tmp/nsupdate
echo "zone $4." >> /tmp/nsupdate
echo "update add $1 600 A $2" >> /tmp/nsupdate
echo "send" >> /tmp/nsupdate

nsupdate -k /etc/rndc.key -v /tmp/nsupdate 2>&1
rm -rf /tmp/nsupdate


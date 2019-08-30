#!/bin/bash
# Adiciona a entrada HOSTNAME e IP no servidor BIND9. $1 aguarda o hostanme e $2 aguarda o IP. Sera preenchido pelo formulario do vRO.

echo "server dns1.hl.local" > /tmp/nsupdate
echo "debug yes" >> /tmp/nsupdate
echo "zone hl.local." >> /tmp/nsupdate
echo "update add $1 600 A $2" >> /tmp/nsupdate
echo "send" >> /tmp/nsupdate

nsupdate -k /etc/rndc.key -v /tmp/nsupdate 2>&1
rm -rf /tmp/nsupdate


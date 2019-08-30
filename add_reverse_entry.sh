#!/bin/bash
# Esse script pega a variavel IP (que sera entregue via formulario do vRO), gera a entrada reversa
# cria o arquivo nsupdate , atualiza o arquivo de configuracao e depois deleta o arquivo nsupdate

IP="10.0.0.231"
REVERSE_IP=`echo $IP | awk -F. '{OFS="."; print $4,$3,$2,$1}'`
HOSTNAME="jader.hl.local"

echo "update add $REVERSE_IP.in-addr.arpa 600 IN PTR $HOSTNAME" >> /tmp/nsupdate
echo "send" >> /tmp/nsupdate

nsupdate -k /etc/rndc.key -v /tmp/nsupdate 2>&1
rm -rf /tmp/nsupdate

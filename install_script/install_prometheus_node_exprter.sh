#!/usr/bin/env bash
echo """====> install node_exporter

     PREFIX : ${PREFIX:=$HOME/local}
     VERSION : ${VERSION:=0.16.0}
     WORKDIR : ${MY_INSTALL_WORKDIR:=$HOME/tmp}

"""

mkdir -p $MY_INSTALL_WORKDIR/node_exporter
cd $MY_INSTALL_WORKDIR/node_exporter || exit -1

(wget https://github.com/prometheus/node_exporter/releases/download/v${VERSION}/node_exporter-${VERSION}.linux-amd64.tar.gz \
     && tar zxvf node_exporter-${VERSION}.linux-amd64.tar.gz \
     && mv node_exporter-${VERSION}.linux-amd64/node_exporter $PREFIX/bin/) || exit -1

echo -n "add firewalld setting to open port 9100? [y/else]"
read answer
if [ "$answer" != "y" ]; then
    exit
fi
sudo firewall-cmd --add-port=9100/tcp --zone=public --permanent \
    && sudo firewall-cmd --reload
sudo firewall-cmd --list-all

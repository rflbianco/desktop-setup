#!/bin/sh

sudo apt update
sudo apt install -y apt-transport-https ca-certificates

DBEAVER_VERSION=${DBEAVER_VERSION:-"$(curl -sL -H "Accept: application/vnd.github.v3+json" -i https://api.github.com/repos/serge-rider/dbeaver/releases/latest | grep -Eo '"tag_name": ".*?"' | grep -Eo '[0-9\.]+')"}
DBEAVER_PACKAGE="dbeaver-ce_${DBEAVER_VERSION}_amd64.deb"
wget https://github.com/serge-rider/dbeaver/releases/download/${DBEAVER_VERSION}/${DBEAVER_PACKAGE} -O /tmp/${DBEAVER_PACKAGE}

sudo dpkg --install /tmp/${DBEAVER_PACKAGE}

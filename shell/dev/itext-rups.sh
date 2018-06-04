#!/bin/bash

# sudo apt update
# sudo apt install -y apt-transport-https ca-certificates

itext_rups_version=${ITEXT_RUPS_VERSION:-'latest'}
itext_rups_tag="${ITEXT_RUPS_VERSION:+"tags/${ITEXT_RUPS_VERSION}"}"
itext_rups_path=${itext_rups_tag:-'latest'}
itext_rups_installer_path="/tmp/itext_rups_${itext_rups_version}.zip"
itext_rups_target_path="/opt/itext-rups/"

itext_rups_url=$(curl -sL -H "Accept: application/vnd.github.v3+json" -i "https://api.github.com/repos/itext/rups/releases/${itext_rups_path}" | grep -E 'browser_download_url.+\.zip' | sed -E 's/.*"([^"]+)".*/\1/')

echo "Installing iText RUPS [$itext_rups_version => $itext_rups_path] from $itext_rups_url"
curl -sL ${itext_rups_url} > ${itext_rups_installer_path}

sudo mkdir ${itext_rups_target_path}
sudo unzip ${itext_rups_installer_path} -d ${itext_rups_target_path}

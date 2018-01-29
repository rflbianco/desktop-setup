#!/bin/bash

# sudo apt update
# sudo apt install -y apt-transport-https ca-certificates

franz_version=${FRANZ_VERSION:-'latest'}
franz_tag="${FRANZ_VERSION:+"tags/${FRANZ_VERSION}"}"
franz_path=${franz_tag:-'latest'}
franz_installer="franz_${franz_version}.deb"

franz_url=$(curl -sL -H "Accept: application/vnd.github.v3+json" -i "https://api.github.com/repos/meetfranz/franz/releases/${franz_path}" | grep -E 'browser_download_url.+\.deb' | sed -E 's/.*"([^"]+)".*/\1/')

echo "Installing Franz [$franz_version => $franz_path] from $franz_url"
curl -sL ${franz_url} > /tmp/${franz_installer}

sudo dpkg --install /tmp/${franz_installer}
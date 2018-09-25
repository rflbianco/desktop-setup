#!/bin/bash

# install build dependencies
sudo apt --no-install-recommends -yqq install \
  bash-completion \
  build-essential \
  cmake \
  libcurl4  \
  libcurl4-openssl-dev  \
  libssl-dev  \
  libxml2 \
  libxml2-dev  \
  libssl1.1 \
  pkg-config \
  ca-certificates \
  xclip

# clone lastpass-cli from GitHub
(   cd /tmp \
 && git clone https://github.com/lastpass/lastpass-cli )

# build and install it from source code
(   cd /tmp/lastpass-cli \
 && make \
 && sudo make install )

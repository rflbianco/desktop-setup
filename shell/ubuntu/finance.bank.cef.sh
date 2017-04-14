#!/bin/bash

# Install security module for CEF (Brazillian bank) for firefox on Ubuntu/Debian
sudo apt install libnss3-tools

file_name='GBPCEFwr64.deb'
wget -q "https://cloud.gastecnologia.com.br/cef/warsaw/install/${file_name}" -O "/tmp/${file_name}"
sudo dpkg --install "/tmp/${file_name}"

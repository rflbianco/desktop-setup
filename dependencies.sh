#!/bin/sh

# Installs Ansible
sudo apt install ansible


# Installs Puppet and Librarian Puppet
wget https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
sudo dpkg -i puppetlabs-release-pc1-xenial.deb
sudo apt update
sudo apt install puppet-agent
sudo update-rc.d puppet disable

sudo gem install librarian-puppet

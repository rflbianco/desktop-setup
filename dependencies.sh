#!/bin/sh

# Add Puppet Repository to APT
add_puppet_repository()
{
	# Dowloads and install the `.deb` package that adds Puppet's repository and signing key
	# to APT.
	# Puppet only releases packages for LTS versions of Ubuntu. So, by default this script
	# uses the latest LTS version of Ubuntu. To Override, export `PUPPET_OS_RELEASE` before
	# calling this script.
	os_release_name=${PUPPET_OS_RELEASE:-'xenial'}
	puppet_source_file="puppet5-release-${os_release_name}.deb"
	puppet_source_path="/tmp/${puppet_source_file}"

	wget https://apt.puppetlabs.com/${puppet_source_file} -O ${puppet_source_path}
	sudo dpkg -i ${puppet_source_path}
	rm ${puppet_source_path}
}

# Installs Ansible
install_ansible()
{
	sudo apt install ansible
}


# Installs Puppet and Librarian Puppet
install_puppet()
{
	sudo apt install puppet-agent
	sudo systemctl disable puppet
	sudo gem install librarian-puppet
}


(find /etc/apt/sources.list.d/ -name '*puppet*.list' | grep -E '.*' ) || add_puppet_repository

# Checks whether any application must be installed
# if some needs:
# - add sources (only if not existing)
# - update APT caches
# - install each application (only if not installed)
(command -v ansible && command -v puppet) || (
          sudo apt -y update \
       && (command -v ansible || install_ansible) \
       && (command -v puppet || install_puppet) \
)

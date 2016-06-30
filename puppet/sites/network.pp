##########################################################
# network monitoring tools
package { 'nmap': ensure => 'installed' }

package { 'wireshark': ensure => 'installed' }


##########################################################
# vpn
package { 'network-manager-openvpn': ensure => 'installed' }

package { 'network-manager-vpnc': ensure => 'installed' }


##########################################################
# network remote access
package { 'openssh-server': ensure => 'installed' }

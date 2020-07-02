# oci_dnsmultisearch


-	sudo su

-	vi /etc/dhcp/exit-hooks.d/dhclient-exit-hook-set-hostname.sh
o	Replace : 
# Update /etc/resolv.conf
new_search_domains=("$subnet_domain_name" "$vcn_domain_name")
o	By : 
# Update /etc/resolv.conf
custom_domains =$(cat /etc/oci-resolv-custdomains)
new_search_domains=("$subnet_domain_name" "$vcn_domain_name" "$custom_domains")
o	write and quit 

-	 vi /etc/oci-resolv-custdomains
bstest.domain1.com bstest.domain2.com
o	write and quit 

-	vi /etc/oci-hostname.conf
o	Replace : 
PRESERVE_HOSTINFO=0
o	By : 
PRESERVE_HOSTINFO=3

-	reboot

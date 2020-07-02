# oci_dnsmultisearch


-	sudo su

-	vi /etc/dhcp/exit-hooks.d/dhclient-exit-hook-set-hostname.sh
o	Replace : 
"# Update /etc/resolv.conf"
new_search_domains=("$subnet_domain_name" "$vcn_domain_name")
o	By : 
"# Update /etc/resolv.conf"
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

'''
cp /etc/dhcp/exit-hooks.d/dhclient-exit-hook-set-hostname.sh /etc/dhcp/exit-hooks.d/dhclient-exit-hook-set-hostname.sh.bak

sed '/^            # Update \/etc\/resolv.conf/a 			custom_domain_name=$(cat \/etc\/oci-hostname.customdomain)' /etc/dhcp/exit-hooks.d/dhclient-exit-hook-set-hostname.sh > /etc/dhcp/exit-hooks.d/dhclient-exit-hook-set-hostname.sh

sed 's/^            new_search_domains=("$subnet_domain_name" "$vcn_domain_name")/new_search_domains=("$subnet_domain_name" "$vcn_domain_name" "$custom_domain_name")/g' /etc/dhcp/exit-hooks.d/dhclient-exit-hook-set-hostname.sh > /etc/dhcp/exit-hooks.d/dhclient-exit-hook-set-hostname.sh

sed 's/^PRESERVE_HOSTINFO=0/PRESERVE_HOSTINFO=3/g' /etc/oci-hostname.conf

echo bstest.domain1.com bstest.domain2.com > oci-hostname.customdomain
'''

#!/bin/bash
cp /etc/dhcp/exit-hooks.d/dhclient-exit-hook-set-hostname.sh /etc/dhcp/exit-hooks.d/dhclient-exit-hook-set-hostname.sh.bak
cp /etc/oci-hostname.conf /etc/oci-hostname.bak
sed -i '/^            # Update \/etc\/resolv.conf/a 			custom_domains=$(cat \/etc\/oci-custom-search-dns)' /etc/dhcp/exit-hooks.d/dhclient-exit-hook-set-hostname.sh 
sed -i 's/^            new_search_domains=("$subnet_domain_name" "$vcn_domain_name")/new_search_domains=("$subnet_domain_name" "$vcn_domain_name" "$custom_domains")/g' /etc/dhcp/exit-hooks.d/dhclient-exit-hook-set-hostname.sh
sed -i 's/^PRESERVE_HOSTINFO=0/PRESERVE_HOSTINFO=3/g' /etc/oci-hostname.conf
echo bstest.domain1.com bstest.domain2.com > /etc/oci-custom-search-dns

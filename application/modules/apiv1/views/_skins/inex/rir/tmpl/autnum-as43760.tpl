password: {$options.rir.ripe_password}

aut-num:        AS43760
as-name:        INEX-RS
descr:          INEX Route Server ASN
descr:          Internet Neutral Exchange Association Ltd.
remarks:        -------------------------------------------------------
remarks:
remarks:        INEX Route Server Routing Policy:
remarks:
remarks:        prevent announcement of a prefix to a peer    0:peer-as
remarks:        announce a route to a certain peer            43760:peer-as
remarks:        prevent announcement of a prefix to all peers 0:43760
remarks:        announce a route to all peers                 43760:43760
remarks:
remarks:        Notes:
remarks:        - we use a per-client RIB
remarks:        - local-preference is not modified in our RIBs
remarks:        - AS43760 is stripped from the AS path sent to clients
remarks:        - MEDs and next-hop are not modified
remarks:        - communities are stripped from all announcements to
remarks:          clients
remarks:        - we filter inbound routing prefixes based on IRR
remarks:          information pulled from whois.ripe.net.  Please check
remarks:          your public routing policy before complaining that
remarks:          we're ignoring your prefixes.  This particularly
remarks:          applies to IPv6 prefixes.
remarks:        - community 43760:43760 is really just a NOP
remarks:
remarks:        -------------------------------------------------------
org:            ORG-INEX1-RIPE
admin-c:        INO7-RIPE
tech-c:         INO7-RIPE
mnt-by:         INEX-NOC
mnt-routes:     INEX-NOC
changed:        ripe-admin@inex.ie

{foreach $rsclients as $vlanid => $vlan}
    {foreach $vlan.clients as $custid => $vlanints}
        {$cust = $customers.$custid}
	    {foreach $protocols as $proto}
            {foreach $vlanints as $vliid => $addresses}
                {if not isset( $addresses.$proto ) }
                    {continue}
                {/if}
                {foreach $vlan.servers.$proto as $serverip}
                    {if $proto eq 4}

import:         from AS{$cust->getAutsys()} {$addresses.$proto} at {$serverip} 
                accept {$cust->resolveAsMacro( $proto, 'AS' )}  # {$cust->getName()}
export:         to AS{$cust->getAutsys()} {$addresses.$proto} at {$serverip}
                announce AS-SET-INEX-RS
                    {else}

mp-import:      afi ipv6.unicast
                from AS{$cust->getAutsys()} {$addresses.$proto} at {$serverip}
                accept {$cust->resolveAsMacro( $proto, 'AS' )}  # {$cust->getName()}
mp-export:      afi ipv6.unicast
                to AS{$cust->resolveAsMacro( $proto, 'AS' )}  # {$cust->getName()}
                announce AS-SET-INEX-RS
                    {/if}
                {/foreach}
            {/foreach}
        {/foreach}
    {/foreach}
{/foreach}

source:         RIPE
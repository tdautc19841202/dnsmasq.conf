#!/bin/ash

# GPL $Id: dnsmasq,v 1.2 2005/03/22 15:06:14 cvonk Exp $
# system init for DNS forwarder and DHCP server (dnsmasq)

case "$1" in
    start)
        dnsmasq -C /etc/dnsmasq/dnsmasq.conf
        ;;
    stop)
        killall dnsmasq 2>/dev/null
        ;;
    restart)
	$0 stop
	$0 start
	;;
    status)
        if pidof dnsmasq | sed "s/$$\$//" | grep -q [0-9] ; then
	    echo "running"
        else
	    echo "stopped"
        fi
        ;;
esac
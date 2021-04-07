#! /bin/sh
 
DEFAULT_IP=127.0.0.1
IP=${3:-$DEFAULT_IP}
 
case "$1" in
  add)
        echo "$IP $2"  >> /etc/hosts
        ;;
  remove)
        sed -i "/\s$2/d" /etc/hosts
        ;;
 
  *)
        echo "Usage: update-hosts COMMAND [args..]"
        echo
	echo "Utility for adding or removing entries in hosts file"
 	echo
	echo "Commands:"
	echo "	add	update-hosts add [hostname] [ip]"
	echo "	remove	update-hosts remove [hostname]"
	echo
        echo "Ip defaults to 127.0.0.1"
	echo
        echo "Examples:"
        echo "	update-hosts add testing.com 127.0.0.2"
        echo "	update-hosts remove testing.com"
        exit 1
        ;;
esac
 
exit 0

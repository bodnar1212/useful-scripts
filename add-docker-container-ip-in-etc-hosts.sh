#!/bin/bash

print_help () {
    echo -e "USAGE: docker-container-ip.sh CONTAINER_NAME DOMAIN_NAME\n"
    echo "CONTAINER_NAME: A string for target container."
    echo "    e.g. brizy_api"
    echo "DOMAIN_NAME: A string for target domain."
    echo "    e.g. apiv2.com"
    echo -e "\n[Example usecases]"
    echo "  Add brizy api domain to /etc/hosts:"
    echo "    1. Run the command: $ docker-container-ip.sh brizy_api apiv2.com"
}

container_name=$1
domain_name=$2

if [ "$container_name" == "" ] || [ "$domain_name" == "" ]
then
  echo -e "container_name and domain_name are reuired parameters\n"
   print_help
    exit 255
fi

container_id=$(docker ps | grep -w $container_name | grep -o -e '^\S*')
ip=$(docker inspect --format="{{ .NetworkSettings.Networks.projectdocker_default.IPAddress }}" $container_id)

#remove previous
sed -i "/\s$domain_name/d" /etc/hosts

#add new
echo "$ip $domain_name"  >> /etc/hosts

echo "${ip} ${domain_name} was added successfully in /etc/hosts"

exit 0

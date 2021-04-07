Examples
========

add-docker-container-ip-in-etc-hosts.sh
-----

- sudo ./add-docker-container-ip-in-etc-hosts.sh brizy_api apiv2.com
- sudo ./add-docker-container-ip-in-etc-hosts.sh brizy_api_mysql database.com
- sudo ./add-docker-container-ip-in-etc-hosts.sh brizy_cms cmsui.com


manage-etc-hosts.sh (For example site domains)
----

- sudo ./manage-etc-hosts.sh add xxx.brizysite.com
- sudo ./manage-etc-hosts.sh add xxx.brizysite.com 127.0.0.1
- sudo ./manage-etc-hosts.sh remove xxx.brizysite.com

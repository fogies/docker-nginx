#!/bin/bash

# Put our config into the correct location
cp -f /config/nginx.conf /etc/nginx/nginx.conf

# Launch our server, making it the process to ensure Docker behaves
# http://www.projectatomic.io/docs/docker-image-author-guidance/
exec nginx -g "daemon off;"

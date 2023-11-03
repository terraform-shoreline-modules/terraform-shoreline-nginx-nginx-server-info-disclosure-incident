

#!/bin/bash



# Backup the original configuration file

sudo cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak



# Remove server signature from the configuration file

sudo sed -i 's/server_tokens .*;/server_tokens off;/' /etc/nginx/nginx.conf



# Restart NGINX service to apply the changes

sudo systemctl restart nginx
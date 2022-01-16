#!/bin/bash

print "### CADDY PHP AUTOINSTALL SCRIPT ###"
print "Please ensure you are running this script with sudo privileges!"

# -
# Update system
# -
apt-get update -y
apt-get upgrade -y

# -
# Add Caddy repositories
# -
apt-get install -y debian-keyring debian-archive-keyring apt-transport-https
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | tee /etc/apt/trusted.gpg.d/caddy-stable.asc
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | tee /etc/apt/sources.list.d/caddy-stable.list

# -
# Add sury PHP repositories
# -
sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list' 
wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add - 

# -
# Update system, again
# -
apt-get update -y

# -
# Install PHP
# -
apt-get install -y php8.1 php8.1-fpm php-pear php8.1-mysql

# -
# Install Caddy
# -
apt-get install -y caddy

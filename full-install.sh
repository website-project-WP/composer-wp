#!/bin/sh

#Configuration
domain="exemple.tld" #edit this line by your own domain name (your-name.tld)
name="Website Project WP" # Edit this line to pub your own name
php_version="7.4" # default Ubuntu 20.04
ip4_local="" # Local IPV4 of server exemple 10.0.0.1
ip6_local="" # Local IPV6 of server exemple 111dd:c15dv:15vd1::100
ip4_myIP="" # Your own IPv4 for SSH exemple 10.0.0.1
ip6_myIP="" # Your own IPv6 for SSH exemple 111dd:c15dv:15vd1::100

###########################
###########BASIC###########
###########INSTALL#########
###########################

apt install -y curl openssl apache2 composer certbot python3-certbot-apache2 clamav clamav-daemon fail2ban net-tools ufw zip unzip mariadb-server php php-xml php-fpm php-cli php-curl php-mysql php-gd php-mbstring php-imagick php-intl php-xml php-zip php-cgi php-xmlrpc php-soap tidy php-tidy sqlite php-pear -y
	########		SERVER WEB		########
	systemctl enable apache2 
	 /lib/systemd/systemd-sysv-install enable apache2

	########		ANTIVIRUS		########
	systemctl enable clamav-freshclam 
	 /lib/systemd/systemd-sysv-install enable clamav-freshclam

	########		FAILTOBAN		########
	systemctl enable fail2ban
	 /lib/systemd/systemd-sysv-install enable fail2ban
	 
	########		PHP-FPM		########
	systemctl enable php${php_version}-fpm
	 /lib/systemd/systemd-sysv-install enable php${php_version}-fpm
	 

# Take the project website Project WP

sudo -i
cd /var/www
# mkdir -p wp2 && cd wp2
git clone https://github.com/alexonbstudio/website-project.git
cd website-project
composer update
composer dump-autoload -o -a
composer cc && composer archive









# crontab 
(crontab -l 2>>/dev/null; echo "@weekly rm -rf /var/log/apache*/*.log \n
@monthly rm -rf /var/log/apt/*.log \n
@monthly rm -rf /var/log/clamav/*.log \n
@monthly rm -rf /var/log/journal/*.log \n
@monthly rm -rf /var/log/letsencrypt/*.log \n
@weekly apt update && apt upgrade -y \n
@weekly apt-get update && apt-get upgrade -y \n
@daily systemctl stop clamav-freshclam && freshclam --quiet && systemctl start clamav-freshclam \n
* * * */6 * reboot now") | crontab -




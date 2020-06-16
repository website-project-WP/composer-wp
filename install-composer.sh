#!/bin/sh 


###Scripting by Hostinger edited AlexonbStudio

# Require software PHP for Website Project (WP) futur V2
# automate require use of project


clear

if [ ! -d /var/www/html ]; then
	echo "Nice it's install composer/PHP automatic on /var/www/html"
	cd /var/www/html # && mkdir -p libs
	curl -O https://getcomposer.org/download/1.10.7/composer.phar

else
	echo "Nice it's install composer/PHP automatic"
	curl -O https://getcomposer.org/download/1.10.7/composer.phar



fi
 
EXPECTED_SIGNATURE = $( wget -q -O - https://composer.github.io/installer.sig ) 
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" 

ACTUAL_SIGNATURE = $( php -r "echo hash_file('SHA384', 'composer-setup.php');" ) 

if [ " $EXPECTED_SIGNATURE " ! = " $ACTUAL_SIGNATURE " ]; then>&2 

	echo 'ERROR: Invalid installer signature' 
	rm -f composer-setup.php
	mv -f composer.phar /usr/local/bin/composer
exit 1 
	
fi 
	php composer-setup.php --quiet RESULT = $? 
	rm -f composer-setup.php
	mv -f composer.phar /usr/local/bin/composer


# Update composer
composer self-update


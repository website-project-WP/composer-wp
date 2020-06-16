#!/bin/sh 


###Scripting by AlexonbStudio

clear

if [ ! -x composer ]; then

	# Update composer
	composer self-update
	composer update --no-dev
	composer dump-autoload --no-dev
	composer clearcache	
else
	curl -O https://raw.githubusercontent.com/website-project-WP/composer-wp/master/install-composer.sh | bash

fi




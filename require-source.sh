#!/bin/sh 


###Scripting by Hostinger edited AlexonbStudio

# Require software PHP for Website Project (WP) futur V2
# automate require use of project


clear

if [ ! -x composer ]; then
	composer require phpmailer/phpmailer --no-dev
	composer require matthiasmullie/minify --no-dev
	composer install --no-dev
	composer update --no-dev
	composer dump-autoload --no-dev
	composer clearcache	
else
	curl -O  | bash


fi


# Update composer
composer self-update


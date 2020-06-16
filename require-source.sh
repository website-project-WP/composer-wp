#!/bin/sh 


###Scripting by AlexonbStudio

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


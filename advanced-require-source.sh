#!/bin/sh 


###Scripting by Hostinger edited AlexonbStudio

# Require software PHP for Website Project (WP) futur V2
# automate require use of project


clear

if [ ! -x composer ]; then
	composer require symfony/asset --no-dev
	composer require symfony/cache --no-dev
	composer require symfony/phpunit-bridge --no-dev
	composer require adodb/adodb-php --no-dev
	composer install --no-dev
	composer update --no-dev
	composer dump-autoload --no-dev
	composer clearcache	
else
	curl -O  | bash


fi


# Update composer
composer self-update


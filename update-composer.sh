#!/bin/sh 


###Scripting by AlexonbStudio

clear

if [ ! -x composer ]; then

	# Update composer
	composer self-update

else
	curl -O  | bash

fi




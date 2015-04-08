#!/bin/bash

if [ -L /usr/bin/phpunit ]; then
 echo "/usr/bin/phpunit already exists"
else
 ln -s /var/www/ora/src/vendor/phpunit/phpunit/phpunit /usr/bin/
 echo "/usr/bin/phpunit symbolic link created"
fi

if [ -L /usr/bin/behat ]; then
 echo "/user/bin/behat already exists"
else
 ln -s /var/www/ora/src/vendor/behat/behat/bin/behat /usr/bin/
 echo "/usr/bin/behat symbolic link created"
fi

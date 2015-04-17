# ora-vagrant
## Introduction
This is a Vagrant Virtual Machine for ORA project

## Installation
The recommended way to get a working copy of this project is to clone the repository and run the virtual machine.

``` shell
git clone https://github.com/cocoonprojects/ora-vagrant.git
cd ora-vagrant
vagrant up
```
Then log into the machine, clone the O.R.A. repository and install all dependencies
``` shell
vagrant ssh
cd /var/www
git clone git@github.com:cocoonprojects/ora.git
cd ora/src
composer install
sudo ln -s /var/www/ora/src/vendor/phpunit/phpunit/phpunit /usr/bin/
sudo ln -s /var/www/ora/src/vendor/behat/behat/bin/behat /usr/bin/
sudo vim /etc/php5/cli/conf.d/20-xdebug.ini
```
Into the xdebug.ini file set the property
```property
xdebug.max_nesting_level=500
```
Now set up all the `.local` configurations, including database connection settings and the run the database creation (using password `ora_DB!` and including the `event_stream` table using the sql script)
``` shell
vendor/bin/doctrine-module orm:schema-tool:create
mysql -u ora -p oraproject
```
``` sql
CREATE TABLE IF NOT EXISTS `event_stream` (
  `eventId` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `version` int(11) NOT NULL,
  `eventName` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` text COLLATE utf8_unicode_ci NOT NULL,
  `occurredOn` text COLLATE utf8_unicode_ci NOT NULL,
  `aggregate_id` text COLLATE utf8_unicode_ci NOT NULL,
  `aggregate_type` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`eventId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
```
## Content
* Apache Web Server + PHP 5.5
* Composer
* MySql
* SendMail + MailUtils

## More
To update Composer: `sudo composer self-update` from the inside the virtual machine

To install VIM: `sudo apt-get install vim` from the inside the virtual machine

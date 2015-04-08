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
git clone https://github.com/cocoonprojects/ora.git
cd ora/src
composer install
```
Now set up all the .local configurations, including database connection settings and the run the database creation (using password `ora_DB!` and including the `event_stream` table using the sql script)
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
* NodeJS
* Bower

## More
To update Composer: `sudo composer self-update` from the inside the virtual machine

# wordpress-ols-PHP8-docker
Building Docker image with wordpress on PHP 8 and openlitespeed web server

Based on official Openlitespeed Docker image, PHP version was changed to php8.0 + dependencies. 
Included ENV for futher using with wordpress and MariaDB in helm chart.

Didn't test certificate obtaining, but included acme.sh into image. 

entrypoint.sh downloads Wordpress archive (ver. 5.6.2), setup vhost dir under /var/www/vhosts/$VHOST, installs wordpress with wp-cli. 

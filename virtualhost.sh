#!/bin/bash
clear
echo "Enter your domain name [ex. mydomain.com] : "
read domain_name
mkdir -p /var/www/$domain_name/public_html

chown -R $USER:$USER /var/www/$domain_name/public_html
chmod -R 755 /var/www

echo "<?php"> /var/www/$domain_name/public_html/index.php
echo "phpinfo();"> /var/www/$domain_name/public_html/index.php
echo "?>"> /var/www/$domain_name/public_html/index.php

echo "<VirtualHost *:80>" > /etc/apache2/sites-available/$domain_name.conf
echo "        ServerAdmin webmaster@localhost" >> /etc/apache2/sites-available/$domain_name.conf
echo "		  ServerName $domain_name" >> /etc/apache2/sites-available/$domain_name.conf
echo "        ServerAlias $domain_name" >> /etc/apache2/sites-available/$domain_name.conf
echo "        DocumentRoot /var/www/$domain_name/public_html/" >> /etc/apache2/sites-available/$domain_name.conf
echo "        <Directory />" >> /etc/apache2/sites-available/$domain_name.conf
echo "        	Options FollowSymLinks" >> /etc/apache2/sites-available/$domain_name.conf
echo "        	AllowOverride None" >> /etc/apache2/sites-available/$domain_name.conf
echo "        </Directory>" >> /etc/apache2/sites-available/$domain_name.conf
echo " " >> /etc/apache2/sites-available/$domain_name.conf
echo "        <Directory /var/www/$domain_name/public_html/>" >> /etc/apache2/sites-available/$domain_name.conf
echo "        	Options Indexes FollowSymLinks MultiViews" >> /etc/apache2/sites-available/$domain_name.conf
echo "        	AllowOverride None" >> /etc/apache2/sites-available/$domain_name.conf
echo "        	Order allow,deny" >> /etc/apache2/sites-available/$domain_name.conf
echo "        	allow from all" >> /etc/apache2/sites-available/$domain_name.conf
echo "        </Directory>" >> /etc/apache2/sites-available/$domain_name.conf
echo " " >> /etc/apache2/sites-available/$domain_name.conf
echo "        ScriptAlias /cgi-bin/ /usr/lib/cgi-bin/" >> /etc/apache2/sites-available/$domain_name.conf
echo "        <Directory "/usr/lib/cgi-bin">" >> /etc/apache2/sites-available/$domain_name.conf
echo "        	AllowOverride None" >> /etc/apache2/sites-available/$domain_name.conf
echo "        	Options +ExecCGI -MultiViews +SymLinksIfOwnerMatch" >> /etc/apache2/sites-available/$domain_name.conf
echo "        	Order allow,deny" >> /etc/apache2/sites-available/$domain_name.conf
echo "        </Directory>" >> /etc/apache2/sites-available/$domain_name.conf
echo "" >> /etc/apache2/sites-available/$domain_name.conf
echo "        ErrorLog ${APACHE_LOG_DIR}/error.log" >> /etc/apache2/sites-available/$domain_name.conf
echo "        LogLevel warn" >> /etc/apache2/sites-available/$domain_name.conf
echo "" >> /etc/apache2/sites-available/$domain_name.conf
echo "        CustomLog ${APACHE_LOG_DIR}/access.log combined" >> /etc/apache2/sites-available/$domain_name.conf
echo "" >> /etc/apache2/sites-available/$domain_name.conf
echo "        Alias /doc/ '/usr/share/doc'" >> /etc/apache2/sites-available/$domain_name.conf
echo "        <Directory '/usr/share/doc'>" >> /etc/apache2/sites-available/$domain_name.conf
echo "        	Options Indexes MultiViews FollowSymLinks" >> /etc/apache2/sites-available/$domain_name.conf
echo "        	AllowOverride None" >> /etc/apache2/sites-available/$domain_name.conf
echo "        	Order deny,allow" >> /etc/apache2/sites-available/$domain_name.conf
echo "        	Deny from all" >> /etc/apache2/sites-available/$domain_name.conf
echo "        	Allow from 127.0.0.0/255.0.0.0 ::1/128" >> /etc/apache2/sites-available/$domain_name.conf
echo "        </Directory>" >> /etc/apache2/sites-available/$domain_name.conf
echo "" >> /etc/apache2/sites-available/$domain_name.conf
echo "</VirtualHost>" >> /etc/apache2/sites-available/$domain_name.conf

a2ensite $domain_name.conf
service apache2 restart

echo " "
echo "Congrats!"
echo "You can visit your site at http://$domain_name"
echo "You need to need to point your VPS IP address to your domain in order for it to workout. Go to your domain registrar."
echo " "
echo "                         CREATED BY                           "
echo " 															    "
echo "  *****    *****    *****  **     **  *****    *****  **   ** "
echo " **    *  **   **   **     ** * * **  **   *   **     **   ** "
echo " **  ***  ** ***    *****  **  *  **  **    *  *****  **   ** "
echo " **    *  **   **   **     **     **  **   *   **      ** **  "
echo "  *****   **   **   *****  **     **  *****    *****     *    "
echo " 				  											    "
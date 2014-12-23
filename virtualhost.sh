#!/bin/bash
clear
echo "Enter your domain name [ex. mydomain.com] : "
read domain_name
mkdir -p /var/www/$domain_name/public_html

chown -R $USER:$USER /var/www/$domain_name/public_html
chmod -R 755 /var/www

echo "<!DOCTYPE html>"> /var/www/$domain_name/public_html/default.php
echo "<html>" >> /var/www/$domain_name/public_html/default.php
echo "<head>" >> /var/www/$domain_name/public_html/default.php
echo "  <title>Welcome to $domain_name</title>" >> /var/www/$domain_name/public_html/default.php
echo "</head>" >> /var/www/$domain_name/public_html/default.php
echo "<body>" >> /var/www/$domain_name/public_html/default.php
echo "Hello World!" >> /var/www/$domain_name/public_html/default.php
echo "</body>" >> /var/www/$domain_name/public_html/default.php
echo "</html>" >> /var/www/$domain_name/public_html/default.php


echo "<VirtualHost *:80>" > /etc/apache2/sites-available/$domain_name
echo "        ServerAdmin webmaster@localhost" >> /etc/apache2/sites-available/$domain_name
echo "		  ServerName $domain_name" >> /etc/apache2/sites-available/$domain_name
echo "        ServerAlias $domain_name" >> /etc/apache2/sites-available/$domain_name
echo "        DocumentRoot /var/www/$domain_name/public_html/" >> /etc/apache2/sites-available/$domain_name
echo "        <Directory />" >> /etc/apache2/sites-available/$domain_name
echo "        	Options FollowSymLinks" >> /etc/apache2/sites-available/$domain_name
echo "        	AllowOverride None" >> /etc/apache2/sites-available/$domain_name
echo "        </Directory>" >> /etc/apache2/sites-available/$domain_name
echo " " >> /etc/apache2/sites-available/$domain_name
echo "        <Directory /var/www/$domain_name/public_html/>" >> /etc/apache2/sites-available/$domain_name
echo "        	Options Indexes FollowSymLinks MultiViews" >> /etc/apache2/sites-available/$domain_name
echo "        	AllowOverride None" >> /etc/apache2/sites-available/$domain_name
echo "        	Order allow,deny" >> /etc/apache2/sites-available/$domain_name
echo "        	allow from all" >> /etc/apache2/sites-available/$domain_name
echo "        </Directory>" >> /etc/apache2/sites-available/$domain_name
echo " " >> /etc/apache2/sites-available/$domain_name
echo "        ScriptAlias /cgi-bin/ /usr/lib/cgi-bin/" >> /etc/apache2/sites-available/$domain_name
echo "        <Directory "/usr/lib/cgi-bin">" >> /etc/apache2/sites-available/$domain_name
echo "        	AllowOverride None" >> /etc/apache2/sites-available/$domain_name
echo "        	Options +ExecCGI -MultiViews +SymLinksIfOwnerMatch" >> /etc/apache2/sites-available/$domain_name
echo "        	Order allow,deny" >> /etc/apache2/sites-available/$domain_name
echo "        </Directory>" >> /etc/apache2/sites-available/$domain_name
echo "" >> /etc/apache2/sites-available/$domain_name
echo "        ErrorLog ${APACHE_LOG_DIR}/error.log" >> /etc/apache2/sites-available/$domain_name
echo "        LogLevel warn" >> /etc/apache2/sites-available/$domain_name
echo "" >> /etc/apache2/sites-available/$domain_name
echo "        CustomLog ${APACHE_LOG_DIR}/access.log combined" >> /etc/apache2/sites-available/$domain_name
echo "" >> /etc/apache2/sites-available/$domain_name
echo "        Alias /doc/ '/usr/share/doc'" >> /etc/apache2/sites-available/$domain_name
echo "        <Directory '/usr/share/doc'>" >> /etc/apache2/sites-available/$domain_name
echo "        	Options Indexes MultiViews FollowSymLinks" >> /etc/apache2/sites-available/$domain_name
echo "        	AllowOverride None" >> /etc/apache2/sites-available/$domain_name
echo "        	Order deny,allow" >> /etc/apache2/sites-available/$domain_name
echo "        	Deny from all" >> /etc/apache2/sites-available/$domain_name
echo "        	Allow from 127.0.0.0/255.0.0.0 ::1/128" >> /etc/apache2/sites-available/$domain_name
echo "        </Directory>" >> /etc/apache2/sites-available/$domain_name
echo "" >> /etc/apache2/sites-available/$domain_name
echo "</VirtualHost>" >> /etc/apache2/sites-available/$domain_name

a2ensite $domain_name
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
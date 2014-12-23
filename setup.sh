#!/bin/bash
clear
apt-get update

echo "Successfully updated!"

apt-get -y install nano

apt-get -y install apache2

apt-get -y install mysql-server libapache2-mod-auth-mysql php5-mysql

sudo mysql_install_db

/usr/bin/mysql_secure_installation

apt-get -y install php5 libapache2-mod-php5 php5-mcrypt

rm /etc/apache2/mods-enabled/dir.conf

echo "<IfModule mod_dir.c>" > /etc/apache2/mods-enabled/dir.conf
echo "              DirectoryIndex index.php index.html index.cgi index.pl index.php index.xhtml index.htm" >> /etc/apache2/mods-enabled/dir.conf
echo "</IfModule>" >> /etc/apache2/mods-enabled/dir.conf

service apache2 restart

read -p "Do you want to add virtual host? y/n: " yn
case $yn in
	[Yy]* ) if [ ! -f virtualhost.sh ]; then
				wget https://raw.githubusercontent.com/gremdev/SLAMPad/master/virtualhost.sh -O virtualhost.sh
			fi
			chmod 755 virtualhost.sh;
			./virtualhost.sh;
			exit;;
	[Nn]* ) 
			echo " ";
	echo "Congrats!";
	echo "You can visit your site at http://your-ip-address/";
	echo " ";
	echo "                         CREATED BY                           ";
	echo " 															    ";
	echo "  *****    *****    *****  **     **  *****    *****  **   ** ";
	echo " **    *  **   **   **     ** * * **  **   *   **     **   ** ";
	echo " **  ***  ** ***    *****  **  *  **  **    *  *****  **   ** ";
	echo " **    *  **   **   **     **     **  **   *   **      ** **  ";
	echo "  *****   **   **   *****  **     **  *****    *****     *    ";
	echo " 				  											    ";
	exit;;
	* ) echo "Please answer it with yes/no";;
esac

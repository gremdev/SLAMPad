SLAMPad (Beta)
=======

Simple Linux, Apache, MySQL and PHP Administration v1.0

This is a simple script that automates the installation of Apache, MySQL and PHP on Ubuntu Linux.
Currently tested on Ubuntu 12.04 and 14.04 VPS, but will also work on higher versions.

Note: This is still in Beta. Use at your own risk.

Installation

Option 1: Wget (Recommended)

		wget https://raw.githubusercontent.com/gremdev/SLAMPad/master/setup.sh -O setup.sh

		sudo chmod 755 setup.sh
		sudo ./setup.sh

Option 2: Git
	
		sudo apt-get update
		sudo apt-get install git-core

		git clone https://github.com/gremdev/SLAMPad.git

		cd SLAMPad
		sudo chmod 755 setup.sh

		sudo ./setup.sh

Option 3: Manual

		Copy the contents of setup.sh.
		Create a file and name it setup.sh then paste the copied content. (Or you can do it by sudo nano setup.sh).

		sudo chmod 755 setup.sh
		sudo ./setup.sh


While installing, MySQL will prompt asking for root password. Add your password and confirm it.
MySQL will ask again for your root password and few other questions.

	Remove anonymous users? y
	Disallow root login remotely? y
	Remove test database and access to it? y
	Reload privilege tables now? y

After installing, you can now access your site through http://your-ip-address/.

You also have the option to create virtualhost for your other sites if you wish to host them in a single VPS.

Just answer `y` if it ask to add virtualhost. You need to enter your domain. Currently, it only supports naked domain or domain without `www` or other subdomain.

If you already skipped creating virtualhost, you can still create it by running `virtualhost.sh`. Just chmod it to 755 and run it on sudo mode.

This project was created because I am tired of frequent searching on how to this and that when in fact the process of installing lamp and adding virtualhost on any VPS with Ubuntu OS is the same. You are free to modify, contribute and improve this project.

Coming soon... 

1. Automated installer for some of the popular application such as Wordpress, Laravel, Codeigniter, Git, Composer and others.
2. Automated SSL installation.

Happy Hacking!

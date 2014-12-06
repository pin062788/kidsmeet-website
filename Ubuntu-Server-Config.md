* Setup environment

		sudo locale-gen en_US
		sudo apt-get update
		sudo locale-gen en_US en_US.UTF-8 en_CA.UTF-8
		sudo dpkg-reconfigure locales
		sudo apt-get install apache2 curl git build-essential zlibc zlib1g-dev zlib1g libcurl4-openssl-dev libssl-dev libruby1.9.1 apache2-dev libapr1-dev libaprutil1-dev libreadline6 libreadline6-dev ImageMagick
		sudo apt-get install build-essential libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison
		sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties
		sudo apt-get install mysql-server mysql-client libapache2-mod-auth-mysql libmysql-ruby
		sudo apt-get install sendmail

		#[know issue about libmysql-ruby] https://community.openproject.org/topics/1604
		#sudo mysqladmin -u root -h localhost -p 'k1dsm33t'
    

* Setup Ruby

		ruby -v
		wget ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.gz
		tar xzvf ruby-2.0.0-p0.tar.gz
		cd ruby-2.0.0-p0
		./configure
		#[known issue] http://stackoverflow.com/questions/23488790/compile-ruby-2-0-errors-without-rvm-or-rbenv-readline-c188626-error-func
		make
		sudo make install
		ruby -v
		which ruby
		ls -al /usr/bin/ruby
		ls /usr/local/bin/ruby -v
		ruby -v

* Setup Apache

		sudo mkdir -p /var/www/example.com/public_html
		sudo chown -R $USER:$USER /var/www/example.com/public_html 
		sudo chmod -R 755 /var/www
		sudo vi /var/www/example.com/public_html/index.html
		sudo cp /etc/apache2/sites-available/default /etc/apache2/sites-available/example.com
		sudo vi /etc/apache2/sites-available/example.com
		sudo a2ensite example.com
		sudo service apache2 restart
		apache2 -v
  

* Install Passenger
        #For aliyun
        sudo gem sources --remove https://rubygems.org/
        sudo gem sources -a https://ruby.taobao.org/
		sudo gem update --system
		sudo gem install rails --version 4.1.6
		sudo gem install passenger
		sudo passenger-install-apache2-module
		cd /etc/apache2/
		cd mods-enabled/
		sudo vi /etc/apache2/mods-available/passenger.load
		cat /etc/apache2/mods-available/passenger.load
		sudo vi /etc/apache2/mods-available/passenger.conf
		ls -al /usr/local/lib/ruby/gems/2.0.0/gems/passenger-4.0.53
		cd mods-available/
		cat passenger.conf 
		cat passenger.load 
		sudo a2enmod passenger
		sudo service apache2 restart
		apache2ctl -t -D DUMP_MODULES

* Setup Redis-Server
        sudo apt-get install redis-server
		sudo cp /etc/redis/redis.conf /etc/redis/redis.conf.default

* Setup VirtualHost
			
		cd /tmp	
		git clone https://github.com/wldandan/apache-passenger-virtualhost-trial.git
		cd apache-passenger-virtualhost-trial/
		cd /etc/apache2/
		cd sites-available/
		sudo cp /tmp/apache-passenger-virtualhost-trial/config/kidsmeets.cn.conf .
		sudo a2ensite kidsmeet.cn
		sudo service apache2 restart

* Setup mysql database

        RAILS_ENV=production bundle exec rake db:create
        RAILS_ENV=production bundle exec rake db:migrate

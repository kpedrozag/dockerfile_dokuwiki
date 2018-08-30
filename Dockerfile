FROM ubuntu:16.04
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install apache2 libapache2-mod-php php-xml
RUN apt-get -y install php7.0 php-mbstring php7.0-xml
RUN a2enmod rewrite
RUN apt-get -y install wget
WORKDIR /var/www/html
RUN wget https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz
RUN tar xvf dokuwiki-stable.tgz
RUN rm dokuwiki-stable*
RUN mv dokuwiki-*/* .
RUN chown -R www-data:www-data /var/www/html
RUN rm /var/www/html/index.html
RUN service apache2 restart
EXPOSE 80
CMD /usr/sbin/apache2ctl -D FOREGROUND
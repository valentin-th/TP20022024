FROM ubuntu:latest

EXPOSE 80

RUN apt-get update -y && apt-get upgrade -y

ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get install apache2 -y

WORKDIR /var/www/

RUN mkdir chd.iticparis.com 

ADD index.html /var/www/chd.iticparis.com

ADD chd.iticparis.com.conf /etc/apache2/sites-available

WORKDIR /etc/apache2/sites-available

RUN a2ensite chd.iticparis.com.conf

CMD ["/usr/sbin/apache2ctl", "-D",  "FOREGROUND"]
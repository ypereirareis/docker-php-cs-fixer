FROM ubuntu:14.04

MAINTAINER Yannick Pereira-Reis <yannick.pereira.reis@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# Install common libs
RUN apt-get update && apt-get install -y \
	nano \
	git \
	curl \
	wget \
	build-essential \
	software-properties-common \
	python-software-properties

RUN apt-get update
RUN add-apt-repository -y ppa:ondrej/php5
RUN add-apt-repository -y ppa:nginx/stable

RUN apt-get update && apt-get install -y --force-yes \
	php5 \
	php5-cli \
	php5-common \

RUN sed -i "s/;date.timezone =.*/date.timezone = UTC/" /etc/php5/fpm/php.ini
RUN sed -i "s/;date.timezone =.*/date.timezone = UTC/" /etc/php5/cli/php.ini

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN wget http://get.sensiolabs.org/php-cs-fixer.phar -O php-cs-fixer
RUN sudo chmod a+x php-cs-fixer
RUN sudo mv php-cs-fixer /usr/local/bin/php-cs-fixer

VOLUME ["/app"]

WORKDIR /app

ENTRYPOINT ["php-cs-fixer"]

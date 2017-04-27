FROM debian:jessie

RUN apt-get update && apt-get install -y --force-yes \
        wget \
        php5 \
        php5-cli \
        php5-common \
        && wget http://get.sensiolabs.org/php-cs-fixer.phar -O php-cs-fixer \
        && chmod a+x php-cs-fixer \
        && mv php-cs-fixer /usr/local/bin/php-cs-fixer

VOLUME /app
WORKDIR /app

ENTRYPOINT ["php-cs-fixer"]

CMD ["--help"]

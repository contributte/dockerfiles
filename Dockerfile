FROM debian:sid

MAINTAINER Milan Felix Sulc <rkfelix@gmail.com>

RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y \
		curl \
		git \
		php7.0-cli \
		php7.0-mbstring \
		php7.0-intl \
		php7.0-json \
		php7.0-gd \
		php7.0-xml \
		php7.0-sqlite3 \
		php7.0-zip \
		php7.0-tokenizer && \
	curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
	cd /srv && \
	composer create-project nette/sandbox /srv && \
	apt-get remove -y curl git && \
	apt-get clean -y && apt-get autoclean -y && apt-get autoremove -y && \
	rm -rf /var/lib/apt/lists/* /var/lib/log/* /tmp/* /var/tmp/*

WORKDIR /srv

CMD php -S 0.0.0.0:80 -t /srv/www

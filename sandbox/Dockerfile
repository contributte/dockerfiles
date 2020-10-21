FROM debian:buster

RUN apt-get update && \
	apt-get dist-upgrade -y && \
	# dependencies
	apt-get install -y wget curl apt-transport-https ca-certificates unzip tini && \
	wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
	echo "deb https://packages.sury.org/php/ buster main" > /etc/apt/sources.list.d/php.list && \
	echo "deb [trusted=yes] https://apt.fury.io/caddy/ /" > /etc/apt/sources.list.d/caddy-fury.list && \
	apt-get update && apt-get install -y \
		curl \
		git \
		caddy \
		php7.4-cli \
		php7.4-fpm \
		php7.4-gd \
		php7.4-intl \
		php7.4-json \
		php7.4-mbstring \
		php7.4-sqlite3 \
		php7.4-tokenizer \
		php7.4-xml \
		php7.4-zip && \
	# composer
	curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
	# cleanup
	apt-get remove -y wget && \
	apt-get clean -y && apt-get autoclean -y && apt-get autoremove -y && \
	rm -rf /var/lib/apt/lists/* /var/lib/log/* /tmp/* /var/tmp/*

ADD ./Caddyfile /etc/Caddyfile
ADD ./php.ini /etc/php/7.4/conf.d/999-php.ini
ADD ./php-fpm.conf /etc/php/7.4/php-fpm.conf
ADD ./entrypoint.sh /entrypoint.sh

RUN composer create-project nette/sandbox /srv && \
	chmod 0777 /srv/temp && \
	chmod 0777 /srv/log && \
	rm -rf /srv/tests

WORKDIR /srv

ENTRYPOINT ["/usr/bin/tini", "--", "/entrypoint.sh"]

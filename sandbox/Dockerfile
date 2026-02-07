FROM debian:bookworm

RUN apt-get update && \
	apt-get dist-upgrade -y && \
	# dependencies
	apt-get install -y wget curl ca-certificates unzip tini gnupg && \
	curl -sSLo /tmp/debsuryorg-archive-keyring.deb https://packages.sury.org/debsuryorg-archive-keyring.deb && \
	dpkg -i /tmp/debsuryorg-archive-keyring.deb && rm /tmp/debsuryorg-archive-keyring.deb && \
	echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ bookworm main" > /etc/apt/sources.list.d/php.list && \
	curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg && \
	curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' > /etc/apt/sources.list.d/caddy-stable.list && \
	apt-get update && apt-get install -y \
		curl \
		git \
		caddy \
		php8.5-cli \
		php8.5-fpm \
		php8.5-gd \
		php8.5-intl \
		php8.5-mbstring \
		php8.5-sqlite3 \
		php8.5-xml \
		php8.5-zip && \
	# composer
	curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
	# cleanup
	apt-get remove -y wget && \
	apt-get clean -y && apt-get autoclean -y && apt-get autoremove -y && \
	rm -rf /var/lib/apt/lists/* /var/lib/log/* /tmp/* /var/tmp/*

ADD ./Caddyfile /etc/Caddyfile
ADD ./php.ini /etc/php/8.5/conf.d/999-php.ini
ADD ./php-fpm.conf /etc/php/8.5/php-fpm.conf
ADD ./entrypoint.sh /entrypoint.sh

RUN composer create-project nette/sandbox /srv && \
	chmod 0777 /srv/temp && \
	chmod 0777 /srv/log && \
	rm -rf /srv/tests

WORKDIR /srv

ENTRYPOINT ["/usr/bin/tini", "--", "/entrypoint.sh"]

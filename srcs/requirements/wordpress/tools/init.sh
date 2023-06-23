#!/bin/bash

wp config create	--dbname=$MARIADB_DATABASE \
					--dbuser=$MARIADB_USER \
					--dbpass=$MARIADB_USER_PASSWORD \
					--dbhost=$MARIADB_HOST \
					--path="/var/www/html/" \
					--skip-check \
					--allow-root

if ! wp core is-installed --allow-root; then
	wp core install --url=$WORDPRESS_URL \
					--title=$WORDPRESS_TITLE \
					--admin_user=$WORDPRESS_ADMIN \
					--admin_password=$WORDPRESS_ADMIN_PASSWORD \
					--admin_email=$WORDPRESS_ADMIN_EMAIL \
					--skip-email \
					--allow-root

	wp plugin update --all --allow-root
	
	wp user create $WORDPRESS_USER \
					$WORDPRESS_USER_EMAIL \
					--role=editor \
					--user_pass=$WORDPRESS_USER_PASSWORD \
					--allow-root
	
	wp post generate --count=1 \
						--post_title=$WORDPRESS_TITLE \
						--post_author=$WORDPRESS_ADMIN \
						--allow-root
fi

php-fpm7.3 -F
#!/bin/bash

sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
sed -i "s/password_here/$MYSQL_PASS/g" wp-config-sample.php
sed -i "s/localhost/$WP_HOST/g" wp-config-sample.php
sed -i "s/database_name_here/$MYSQL_DB/g" wp-config-sample.php
cp wp-config-sample.php wp-config.php

php-fpm7.3 -F
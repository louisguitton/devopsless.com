cd /var/www/html

wp plugin uninstall hello --allow-root
wp plugin update --all --allow-root

wp theme install hestia --allow-root
wp theme activate hestia --allow-root

# import demo content

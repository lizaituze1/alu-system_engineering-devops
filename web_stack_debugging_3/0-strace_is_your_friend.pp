# Fixes the WordPress file extension typo that causes the Apache 500 error
exec { 'fix-wordpress':
  command => 'sed -i s/phpp/php/g /var/www/html/wp-settings.php',
  path    => '/bin:/usr/bin:/usr/local/bin',
}

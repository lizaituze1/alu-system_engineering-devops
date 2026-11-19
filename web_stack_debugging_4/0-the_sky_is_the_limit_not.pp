# Raises the Nginx open file limit so it handles more concurrent requests
exec { 'fix--for-nginx':
  command => 'sed -i s/15/4096/ /etc/default/nginx',
  path    => '/bin:/usr/bin:/usr/local/bin',
}

exec { 'restart-nginx':
  command => 'service nginx restart',
  path    => '/bin:/usr/sbin:/usr/bin:/usr/local/bin',
  require => Exec['fix--for-nginx'],
}

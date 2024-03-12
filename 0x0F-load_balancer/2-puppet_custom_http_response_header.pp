#!/usr/bin/env bash
# dOCS

package { 'nginx':
  ensure => installed,
}

file_line { 'aaaaa':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => 'listen 80 default_server;',
  line   => 'rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;',
}

file { '/var/www/html/index.html':
  content => 'Hello World!',
}

service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}

file_line { 'Creating header':
  	ensure => present,
  	path   => '/etc/nginx/sites-available/default',
  	line   => "\tadd_header X-Served-By ${hostname};",
  	after  => 'server_name _;',
	require => Service['nginx'],
}

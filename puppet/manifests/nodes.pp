node 'db' {
	package { 'vim': ensure => present }
	include hosts_file
	include sudo
	include mysql
}

node 'backup' {
	package { 'vim': ensure => present }
	include hosts_file
	include sudo
}

node 'app' {
	package { 'vim': ensure => present }
	include hosts_file
	include sudo
}

node 'mgmt' {
	package { 'vim': ensure => present }
	include hosts_file
	include sudo
	include nagios
}

node 'ad' {

} 

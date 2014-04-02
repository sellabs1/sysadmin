class nagios::config {
	file { "/etc/nagios3/htpasswd.users":
		ensure => present,
		source => "puppet:///modules/nagios/htpasswd.users",
		mode => 0444,
		owner => "root",
		group => "root",
		require => Class["nagios::install"],
		notify => Class["nagios::service"],
	}
	file {"/etc/nagios3/nagios.cfg":
		ensure => present,
		source => "puppet:///modules/nagios/debian-start",
		owner => "root",
		group => "root",
		mode => 0555,
		require => Class["nagios::install"],
		notify => Class["nagios::service"],
	}
}

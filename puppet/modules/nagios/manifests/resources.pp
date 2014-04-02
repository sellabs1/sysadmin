class nagios::resouces {
	 nagios_host { 'db.sqrawler.com':
                 target => '/etc/nagios3/conf.d/ppt_hosts.cfg',
                 alias => 'db',
                 address => '10.25.1.54',
                 check_period => '24x7',
                 max_check_attempts => 3,
                 check_command => 'check-host-alive',
                 notification_interval => 30,
                 notification_period => '24x7',
                 notification_options => 'd,u,r',
                 contact_groups => 'sysadmins',
              }
  
nagios_contactgroup { 'sysadmins':
               target => '/etc/nagios3/conf.d/ppt_contactgroups.cfg',
		mode => '0444',
               alias => 'Systems Administrators',
               members => 'fordgm2, sellabs1',
  }

nagios_contact { 'fordgm2':
              target => '/etc/nagios3/conf.d/ppt_contacts.cfg',
		mode => '0444',
              alias => 'Grant Ford',
              service_notification_period => '24x7',
              host_notification_period => '24x7',
              service_notification_options => 'w,u,c,r',
              host_notification_options => 'd,r',
              service_notification_commands => 'notify-service-by-email',
              host_notification_commands => 'notify-host-by-email',
              email => 'fordgm2@student.op.ac.nz',
  }

nagios_contact { 'sellabs1':
              target => '/etc/nagios3/conf.d/ppt_contacts.cfg',
                mode => '0444',
              alias => 'Bryce Sellars',
              service_notification_period => '24x7',
              host_notification_period => '24x7',
              service_notification_options => 'w,u,c,r',
              host_notification_options => 'd,r',
              service_notification_commands => 'notify-service-by-email',
              host_notification_commands => 'notify-host-by-email',
              email => 'sellabs1@student.op.ac.nz',
  }


nagios_service {'MySQL':
              service_description => 'MySQL DB',
              hostgroup_name => 'db-servers',
              target => '/etc/nagios3/conf.d/ppt_mysql_service.cfg',
              check_command => 'check_mysql',
              max_check_attempts => 3,
              retry_check_interval => 1,
              normal_check_interval => 5,
              check_period => '24x7',
              notification_interval => 30,
              notification_period => '24x7',
              notification_options => 'w,u,c',
              contact_groups => 'sysadmins',
  }

nagios_hostgroup{'db-servers':
              target => '/etc/nagios3/conf.d/ppt_hostgroups.cfg',
		mode => '0444',
              alias => 'Database Servers',
              members => 'db.sqrawler.com',
  }
}

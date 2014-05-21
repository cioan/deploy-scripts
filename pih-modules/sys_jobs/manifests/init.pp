class sys_jobs (
	$email_alerts_to = hiera('email_alerts_to'),
	$hard_drive_percent_alert = hiera('hard_drive_percent_alert'),
	){


	cron { 'disk-alert':
	    ensure  => present,
	    command => '/usr/local/sbin/diskAlert.sh',
	    user    => 'root',
	    hour    => 1,
	    minute  => 30,
	    require => File['diskAlert.sh'],
	  }

	file { 'diskAlert.sh':
	    ensure  => present,
	    path    => '/usr/local/sbin/diskAlert.sh',
	    mode    => '0700',
	    owner   => 'root',
	    group   => 'root',
	    content => template('sys_jobs/diskAlert.sh.erb'),
	  }


}

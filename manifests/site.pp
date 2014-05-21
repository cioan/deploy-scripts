Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/', '/usr/local/bin/' ] }

node default {
  class { 'apt':
    always_apt_update => true,
  }

  include wget
  include java
  include mailx
  include sys_jobs
}

node 'zanmi.pih-emr.org' inherits default {
  
}
class config {

	file {"/etc/puppetlabs/puppet.conf":
		source => "puppet:///modules/config/puppet.conf",
		ensure => present,
        }

	service {"puppet":
		ensure => running,
		enable => true,
		subscribe => File['/etc/puppetlabs/puppet.conf']
	}
}

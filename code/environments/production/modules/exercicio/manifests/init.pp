class exercicio {


file {"/root/.bashrc":
		source => "puppet:///modules/exercicio/bashrc",
		ensure => present,
        }

case $::osfamily {

	"RedHat": {
		$pacotes = ["httpd","crontabs","git"]
		  }		
	
	"Debian": {
		$pacotes = ["apache2","cron","git"]
		  }		

}

	package {$pacotes:
		ensure => present,
	}

$usuario = ['devops','jorge','judith']

user { $usuario:
  ensure             => 'present',
  password_max_age   => 99999,
  password_min_age   => 0,
  password_warn_days => 7,
  shell              => '/bin/bash',
}

}

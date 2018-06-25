class docker {

	exec { "Docker Setup":
		command => "/usr/bin/apt-get update",
		}

	$pacotes = ["apt-transport-https","ca-certificates","curl","software-properties-common"]
	
	package{$pacotes:
		ensure => present,
		}

	exec { "Docker Setup2":
		command => "/usr/bin/curl -fsSL https://download.docker.com/linux/ubuntu/gpg | /usr/bin/apt-key add",
		}

	exec { "Docker Setup3":
                command => "/usr/bin/add-apt-repository \"deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable\"",
                }

	exec { "Docker Setup4":
                command => "/usr/bin/apt-get update",
                }

	package { docker-ce:
                ensure => present,
        }
}

class rpmbuild {

  package {"rpm-build":
    ensure => present,
  }

  package {"yum-utils":
    ensure => present,
  }

  package {"rpmdevtools":
    ensure => present,
  }

  package {"rpmlint":
    ensure => present,
  }

  package {"expect":
    ensure => present,
  }

  package {"gcc":
    ensure => present,
  }

  package {'make':
    ensure => present,
  }

  #to gererate randomness when creating an rpm key
  package {"rng-tools":
    ensure => present,
  }

  file {'/home/vagrant/.rpmmacros':
    owner => "vagrant",
    group => "vagrant",
    mode => "600",
    ensure => file,
    content => ' %_signature gpg
  %_gpg_name example
  ',
  }

  Exec {
    path => ['/usr/bin/'],
    logoutput => true,
  }

  # Install GPG key for rpm build (name=example, password=secret)

  exec {'gpg-key':
    user => 'vagrant',
    command => 'gpg --import /home/vagrant/MY-RPM-GPG-KEY.secret',
    creates => "/home/vagrant/.gnupg/secring.gpg",
    require => File['/home/vagrant/MY-RPM-GPG-KEY.secret'],
  }

  file {'/home/vagrant/MY-RPM-GPG-KEY.secret':
    owner => "vagrant",
    group => "vagrant",
    mode => "600",
    ensure => file,
    source => 'puppet:///modules/rpmbuild/MY-RPM-GPG-KEY.secret',
  }

}

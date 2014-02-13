class maven {

  file {'/home/vagrant/install-maven.sh':
    owner => "vagrant",
    group => "vagrant",
    mode => "744",
    ensure => "file",
    source => 'puppet:///modules/maven/install.sh',
  }

}
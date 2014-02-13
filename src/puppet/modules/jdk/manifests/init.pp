class jdk {

  file {'/home/vagrant/install-jdk.sh':
    owner => "vagrant",
    group => "vagrant",
    mode => "744",
    ensure => "file",
    source => 'puppet:///modules/jdk/install.sh',
  }

}
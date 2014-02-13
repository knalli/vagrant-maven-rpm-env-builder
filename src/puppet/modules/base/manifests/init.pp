class base {

  group { "puppet":
    ensure => "present",
  }

  File { owner => 0, group => 0, mode => 0644 }

  package {"wget":
    ensure => present,
  }

  package {"man":
    ensure => present,
  }

}
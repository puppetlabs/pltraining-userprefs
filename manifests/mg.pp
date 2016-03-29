class userprefs::mg (
  $user    = 'root',
  $group   = 'root',
  $homedir = '/root',
  $default = true,
) {
  contain epel

  package { 'mg':
    ensure  => present,
    require => Class['epel'],
  }


  if $default {
    file_line { 'default editor':
      path    => "${homedir}/.profile",
      line    => 'export EDITOR=mg',
      match   => "EDITOR=",
      require => Package['mg'],
    }
  }
}

class userprefs::ed (
  $user    = 'root',
  $group   = 'root',
  $homedir = '/root',
  $default = true,
) {

  package { 'ed':
    ensure => present,
  }


  if $default {
    file_line { 'default editor':
      path    => "${homedir}/.profile",
      line    => 'export EDITOR=ed',
      match   => "EDITOR=",
      require => Package['ed'],
    }
  }
}

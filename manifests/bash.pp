# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include userprefs::bash
class userprefs::bash {
  package { 'bash':
    ensure => present,
  }

  $users = lookup('userprefs::users', {'merge' => 'hash'})
  $users.each |String $user, Hash $attributes| {
    file {
      default:
        ensure  => file,
        owner   => $user,
        group   => $attributes['group'],
        mode    => '0644',
        require => Package['bash'],
      ;
      "${attributes['home']}/.bashrc":
        source  => 'puppet:///modules/userprefs/shell/bashrc',
      ;
      "${attributes['home']}/.bash_profile":
        source  => 'puppet:///modules/userprefs/shell/bash_profile',
      ;
    }
    user { $user:
      shell  => '/bin/bash',
    }
  }
}

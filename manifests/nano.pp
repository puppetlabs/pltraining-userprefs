# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include userprefs::nano
class userprefs::nano (
  $default = true,
) {
  package { 'nano':
    ensure => present,
  }

  $users = lookup('userprefs::users', {'merge' => 'hash'})
  $users.each |String $user, Hash $attributes| {
    file {
      default:
        ensure => file,
        owner  => $user,
        group  => $attributes['group'],
      ;
      "${attributes['home']}/.nanorc":
        source => 'puppet:///modules/userprefs/nano/nanorc',
      ;
      "${attributes['home']}/.nano.d":
        ensure => directory,
      ;
      "${attributes['home']}/.nano.d/puppet.nanorc":
        source => 'puppet:///modules/userprefs/nano/puppet.nanorc',
      ;
    }
    if $default {
      file_line { "${user} default editor":
        path    => "${attributes['home']}/.profile",
        line    => 'export EDITOR=nano',
        match   => 'EDITOR=',
        require => Package['nano'],
      }
    }
  }
}

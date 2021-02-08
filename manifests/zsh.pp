# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include userprefs::zsh
class userprefs::zsh (
  $default   = true,
) {
  package { 'zsh':
    ensure => present,
  }

  $users = lookup('userprefs::users', {'merge' => 'hash'})
  $users.each |String $user, Hash $attributes| {
    file {
      default:
        ensure  => file,
        owner   => $user,
        group   => $attributes['group'],
        replace => false,
        require => Package['zsh'],
      ;
      # zsh doesn't source .profile by default.
      "${attributes['home']}/.zprofile":
        source  => 'puppet:///modules/userprefs/shell/zprofile',
      ;
      "${attributes['home']}/.zshrc":
        source  => 'puppet:///modules/userprefs/shell/zshrc',
      ;
    }
    if $default {
      user { $user:
        shell => '/bin/zsh',
      }
    }
  }
}

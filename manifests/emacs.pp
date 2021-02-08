# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include userprefs::emacs
class userprefs::emacs (
  $default = true,
) {
  package { 'emacs':
    ensure  => present,
  }

  $users = lookup('userprefs::users', {'merge' => 'hash'})
  $users.each |String $user, Hash $attributes| {
    if $default {
      file_line { "${user} default editor":
        path  => "${attributes['home']}/.profile",
        line  => 'export EDITOR=emacs -nw',
        match => 'EDITOR=',
      }
    }
  }
}

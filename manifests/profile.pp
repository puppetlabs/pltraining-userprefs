# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include userprefs::profile
class userprefs::profile {
  $users = lookup('userprefs::users', {'merge' => 'hash'})
  $users.each |String $user, Hash $attributes| {
    file {
      default:
        owner => $user,
        group => $attributes['group'],
        mode  => '0644',
    ;
    "${attributes['home']}/.profile":
      ensure  => 'file',
      replace => false, # allow users to customize their .profile
      source  => 'puppet:///modules/userprefs/shell/profile',
    ;
    }
  }
}

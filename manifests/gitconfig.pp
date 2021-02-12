# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include userprefs::gitconfig
class userprefs::gitconfig {

  if $facts['osfamily'] == 'RedHat' {
    $users = lookup('userprefs::users', {'merge' => 'hash'})
    $users.each |String $user, Hash $attributes| {
      file { "${attributes['home']}/.gitconfig":
        ensure => file,
        owner  => $user,
        group  => $attributes['group'],
        mode   => '0644',
        source => 'puppet:///modules/userprefs/gitconfig',
      }
    }
  }
}

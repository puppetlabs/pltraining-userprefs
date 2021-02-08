# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include userprefs::npp
class userprefs::npp (
  $user = 'Administrator',
) {
  include userprefs::editors_registry

  package { 'notepadplusplus':
    ensure   => present,
    provider => chocolatey,
  }

  file { "C:/Users/${user}/AppData/Roaming/Notepad++":
    ensure  => directory,
    require => Package['notepadplusplus'],
  }

  file { "C:/Users/${user}/AppData/Roaming/Notepad++/userDefineLang.xml":
    ensure  => file,
    replace => false,
    source  => 'puppet:///modules/userprefs/npp/userDefineLang.xml',
    require => Package['notepadplusplus'],
  }
}

# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include userprefs::sublimetext
class userprefs::sublimetext {
  include userprefs::editors_registry

  package { 'sublimetext3':
    ensure   => present,
    provider => chocolatey,
  }
}

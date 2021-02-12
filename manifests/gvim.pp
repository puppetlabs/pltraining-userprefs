# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include userprefs::gvim
class userprefs::gvim {
  include userprefs::editors_registry

  package { 'vim':
    ensure   => present,
    provider => chocolatey,
  }
}

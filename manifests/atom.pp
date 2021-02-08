# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include userprefs::atom
class userprefs::atom {
  include userprefs::editors_registry

  package { 'atom':
    ensure   => present,
    provider => chocolatey,
  }
}

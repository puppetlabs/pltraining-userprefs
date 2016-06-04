class userprefs::atom {
  include userprefs::editors_registry

  package { 'atom':
    ensure   => present,
    provider => chocolatey,
  }
}

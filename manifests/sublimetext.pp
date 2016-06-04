class userprefs::sublimetext {
  include userprefs::editors_registry

  package { 'sublimetext3':
    ensure   => present,
    provider => chocolatey,
  }
}

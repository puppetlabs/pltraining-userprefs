class userprefs::gvim {
  include userprefs::editors_registry

  package { 'vim':
    ensure   => present,
    provider => chocolatey,
  }
}

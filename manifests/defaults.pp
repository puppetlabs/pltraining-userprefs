class userprefs::defaults {
  include userprefs::profile

  class { 'userprefs::bash':
    password => hiera('user_prefs_pwd'),
    replace  => true,
  }

  class { 'userprefs::mg': default => false }
  class { 'userprefs::vim': default => false }
}

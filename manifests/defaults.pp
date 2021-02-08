# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include userprefs::defaults
class userprefs::defaults {
  include userprefs::profile
  include userprefs::bash
  include userprefs::gitconfig

  class { 'userprefs::vim': default => false }
}

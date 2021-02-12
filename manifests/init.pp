# # @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include userprefs
class userprefs (
  $editor    = undef,
  $shell     = undef,
) {

  if $facts['os']['family'] == 'windows' {
    if $editor {
      if $editor in ['gvim', 'atom', 'sublimetext', 'npp'] {
        class { 'userprefs::windows_editor':
          editor => $editor,
        }
      }
      else {
        fail("The editor ${editor} is unsupported")
      }
    }

    if $shell {
      fail('Attribute "shell" is not supported by Windows')
    }
  }
  else {
    if $editor {
      if $editor in ['vim', 'nano', 'emacs'] {
        include "userprefs::${editor}"
      }
      else {
        fail("The editor ${editor} is unsupported")
      }
    }

    if $shell {
      case $shell {
        'zsh': {
          include userprefs::zsh
        }
        'bash': {
          include userprefs::bash
        }
        default: {
          fail("The shell ${shell} is unsupported")
        }
      }
    }

    include userprefs::profile
    include userprefs::gitconfig
  }
}

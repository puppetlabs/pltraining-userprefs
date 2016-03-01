# Parameterized class to configure a user's environment.
#
# Parameters:
#   editor: Installs syntax highlighting and sets $EDITOR
#           Accepts vim/mg/nano
#    shell: Sets the default shell and installs rc files
#           Accepts zsh/bash
#
class userprefs (
  $editor    = undef,
  $shell     = undef,
  $gitprompt = true,
) {

  if $::osfamily == 'Windows' {
    if $editor {
      if $editor == 'npp' {
      include userprefs::npp
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
      if $editor in ['vim', 'mg', 'nano', 'emacs'] {
        include "userprefs::${editor}"
      }
      else {
        fail("The editor ${editor} is unsupported")
      }
    }

    if $shell {
      case $shell {
        'zsh': {
          class { 'userprefs::zsh':
            gitprompt => $gitprompt,
          }
        }
        'bash': {
          class { 'userprefs::bash':
            gitprompt => $gitprompt,
          }
        }
        default: {
          fail("The shell ${shell} is unsupported")
        }
      }
    }

    include userprefs::profile
  }
}

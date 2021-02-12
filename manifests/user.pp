# # @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include userprefs::user
# Parameters:
#   editor: Installs syntax highlighting and sets $EDITOR
#           Accepts vim/ed/nano
#    shell: Sets the default shell and installs rc files
#           Accepts zsh/bash
#
class userprefs::user (
  $editor = undef,
  $shell  = undef,
) {
  # this weird conditional is to support non-root users in Intro
  $users = lookup('userprefs::users', {'merge' => 'hash'})
  $users.each |String $user, Hash $attributes| {
    $group = $attributes['group']
    $home = $attributes['home']
    if $editor {
      if $editor in ['vim', 'nano', 'emacs'] {
        class { "userprefs::${editor}":
          user    => $user,
          group   => $group,
          homedir => $home,
        }
      }
      else {
        fail("The editor ${editor} is unsupported")
      }
    }

    if $shell {
      if $shell in ['bash', 'zsh'] {
        class { "userprefs::${shell}":
          user    => $user,
          group   => $group,
          homedir => $home,
        }
      }
      else {
        fail("The shell ${shell} is unsupported")
      }
    }

    include userprefs::profile
  }
}

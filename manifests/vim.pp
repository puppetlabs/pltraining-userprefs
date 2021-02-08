# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include userprefs::vim
class userprefs::vim (
  $default     = true,
  $monochrome  = false,
  $line_number = true,
) {
  package { 'vim-enhanced':
    ensure => present,
  }

  $users = lookup('userprefs::users', {'merge' => 'hash'})
  $users.each |String $user, Hash $attributes| {
    if $monochrome == true {
      $syntax   = 'off'
      $hlsearch = 'nohlsearch'
      $t_co     = 't_Co=0'
    }
    else {
      $syntax   = 'on'
      $hlsearch = 'hlsearch'
      $t_co     = 't_Co=256'
    }

    if $line_number == true {
      $line_num = 'number'
    }
    else {
      $line_num = 'nonumber'
    }

    file {
      default:
        ensure => file,
        owner  => $user,
        group  => $attributes['group'],
        mode   => '0644',
      ;
      "${attributes['home']}/.vim":
        ensure  => 'directory',
        source  => 'puppet:///modules/userprefs/vim/vim',
        recurse => true,
      ;
      "${attributes['home']}/.vimrc":
        content => epp('userprefs/vimrc.epp', {
          'syntax'   => $syntax,
          'hlsearch' => $hlsearch,
          't_co'     => $t_co,
          'line_num' => $line_num,
        }),
      ;
    }

    if $default {
      include userprefs::profile
      file_line { "$user default editor":
        path    => "${attributes['home']}/.profile",
        line    => 'export EDITOR=vim',
        match   => 'EDITOR=',
        require => Package['vim-enhanced'],
      }
    }
  }
}

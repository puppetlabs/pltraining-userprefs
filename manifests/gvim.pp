class userprefs::gvim (
  $user    = 'Administrator',
  $default = true,
)  {

  package { 'vim':
    ensure   => present,
    provider => chocolatey,
  }

  if $default {
    registry::value { 'Filetype description':
      key    => 'HKLM\Software\Classes\sourcecode',
      value  => '(Default)',
      data   => 'Source Code',
    }

    registry::value { 'Open with Vi Improved - A Text Editor':
      key    => 'HKLM\Software\Classes\sourcecode\shell\open\command',
      value  => '(Default)',
      data   => '"C:\Program Files (x86)\vim\vim74\gvim.exe" "%1"',
    }

    registry::value { 'Puppet Manifests':
      key    => 'HKLM\Software\Classes\.pp',
      value  => '(Default)',
      data   => 'sourcecode',
    }

    registry::value { 'YAML files':
      key    => 'HKLM\Software\Classes\.yaml',
      value  => '(Default)',
      data   => 'sourcecode',
    }

    registry::value { 'ERB Templates':
      key    => 'HKLM\Software\Classes\.erb',
      value  => '(Default)',
      data   => 'sourcecode',
    }

    registry::value { 'Ruby Source Code':
      key    => 'HKLM\Software\Classes\.rp',
      value  => '(Default)',
      data   => 'sourcecode',
    }
  }
}

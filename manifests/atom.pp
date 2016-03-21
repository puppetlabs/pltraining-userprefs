class userprefs::atom (
  $user    = 'Administrator',
  $default = true,
)  {
  package { 'atom':
    ensure   => present,
    provider => chocolatey,
  }

  if $default {
    registry::value { 'Filetype description':
      key    => 'HKLM\Software\Classes\sourcecode',
      value  => '(Default)',
      data   => 'Source Code',
    }

    registry::value { 'open with atom':
      key    => 'HKLM\Software\Classes\sourcecode\shell\open\command',
      value  => '(Default)',
      data   => '"C:\Users\Administrator\AppData\Local\atom\app-1.6.0\atom.exe" "%1"',
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

    registry::value { 'Conf files':
      key    => 'HKLM\Software\Classes\.conf',
      value  => '(Default)',
      data   => 'sourcecode',
    }
  }
}

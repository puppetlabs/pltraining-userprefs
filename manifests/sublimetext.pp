class userprefs::sublimetext (
  $user    = 'Administrator',
  $default = true,
)  {

  package { 'sublimetext3':
    ensure   => present,
    provider => chocolatey,
  }

  if $default {
    registry::value { 'Filetype description':
      key    => 'HKLM\Software\Classes\sourcecode',
      value  => '(Default)',
      data   => 'Source Code',
    }

    registry::value { 'Open with Sublime Text':
      key    => 'HKLM\Software\Classes\sourcecode\shell\open\command',
      value  => '(Default)',
      data   => '"C:\Program Files\Sublime Text 3\sublime_text.exe" "%1"',
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

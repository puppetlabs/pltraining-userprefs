class userprefs::editors_registry {
  registry::value { 'Filetype description':
    key    => 'HKLM\Software\Classes\sourcecode',
    value  => '(Default)',
    data   => 'Source Code',
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

# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include userprefs::registry
class userprefs::editors_registry {
  registry::value {
    default:
      key   => 'default',
      value => '(Default)',
      data  => 'Source Code',
    ;
    'Filetype description':
      key   => 'HKLM\Software\Classes\sourcecode',
    ;
    'Puppet Manifests':
      key   => 'HKLM\Software\Classes\.pp',
    ;
    'YAML files':
      key   => 'HKLM\Software\Classes\.yaml',
    ;
    'EPP Templates':
      key   => 'HKLM\Software\Classes\.epp',
    ;
    'ERB Templates':
      key   => 'HKLM\Software\Classes\.erb',
    ;
    'Ruby Source Code':
      key   => 'HKLM\Software\Classes\.rb',
    ;
  }
}

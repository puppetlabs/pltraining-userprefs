class userprefs::windows_editor (
  $editor = undef
) {
  include userprefs::editor_registry

  if $editor == 'atom' {
    $editor_name = 'atom'
    $editor_data = '"C:\Users\Administrator\AppData\Local\atom\app-1.6.0\atom.exe" "%1"'
    include userprefs::atom
  }
  if $editor == 'gvim' {
    $editor_name = 'Vi Improved - A Text Editor'
    $editor_data = '"C:\Program Files (x86)\vim\vim74\gvim.exe" "%1"'
    include userprefs::gvim
  }
  elsif $editor == 'sublimetext' {
    $editor_name = 'Sublime Text'
    $editor_data = '"C:\Program Files\Sublime Text 3\sublime_text.exe" "%1"'
    include userprefs::sublimetext
  }
  elsif $editor == 'npp' {
    $editor_name = 'notepadplusplus'
    $editor_data = '"C:\Program Files (x86)\Notepad++\notepad++.exe" "%1"'
    include userprefs::npp
  }

  unless $editor == undef {
    registry::value { "open with ${editor_name}":
      key    => 'HKLM\Software\Classes\sourcecode\shell\open\command',
      value  => '(Default)',
      data   => "${editor_data}",
    }
  }
}

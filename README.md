# userprefs

A simple module that allows users to choose their default editor and, on Linux, default shell used within the Classroom Environment.

## About

This will ensure that the proper packages are installed, the configuration files that enable syntax highlighting are written, helpful shell aliases are enabled, and the default editor and shell are set.

## Class: userprefs

`editor`

An optional String indicating the default editor to be set in the user's environment.  The choices are platform specific.

Default: undef

**Linux** valid choices are: 'vim', 'nano', or 'emacs'

**Windows** valid choices are: 'gvim', 'atom', 'sublimetext', or 'npp'

`shell` (Linux only)

An optional String indicating the shell for the user.  Attempting to set this parameter for a Windows machine will cause a catalog compilation failure.

Default: undef

**Linux** valid choices are: 'bash' or 'zsh'

## Example usage:

Customizing the environment:

```puppet

    class { 'userprefs':
      shell  => 'zsh',  # Linux only - root user's login shell
      editor => 'vim',  # Linux and Windows - default file editor
    }

```

Classifying a Linux (only) node with classroom defaults:

```puppet

    include userprefs::defaults  # Linux only

```

Classifying a Linux (only) node with specific vim options:

```puppet

    class { 'userprefs::vim':  # Linux only
      monochrome  => true,   # Disable syntax highlighting
      line_number => false,  # Disable display of line numbers
    }

```

Contact
-------
* education@puppet.com

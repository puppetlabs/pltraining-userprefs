# userprefs

A simple module that allows users to choose their default editor and default shell.

## About

This will ensure that the proper packages are installed, the configuration files that
enable syntax highlighting are written, helpful shell aliases are enabled, and the
default editor and shell are set.

## Example usage:

Customizing the environment:

```puppet

    class { 'userprefs':
      shell  => 'zsh',  # allowed values: bash/zsh
      editor => 'vim',  #   Linux: emacs/nano/vim
                          Windows: gvim/atom/sublimetext/npp
    }

```

Classifying a node with classroom defaults:

```puppet

    include userprefs::defaults

```

Classifying a node with vim defaults:

```puppet

    class { 'userprefs::vim':
      monochrome  => true,  # this turns off syntax highlighting, allowed values: true/false
      line_number => false, # this turns off line numbering, allowed values: true/false
    }

```

Contact
-------
ben.ford@puppetlabs.com  
js@puppetlabs.com  
education@puppetlabs.com  


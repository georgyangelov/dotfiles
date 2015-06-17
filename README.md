# Dotfiles

A repository with my configuration for various applications with scripts to manage them. The install script will use symlinks on \*nix OS-es and will copy the files on Windows. On Windows, supports the mSysGit bash.

## Management


To install, run
```bash
$ ./install.sh
```

To package all specified home directories, run
```bash
$ ./package.sh
```

This will copy the files back to this repo (if on Windows) and run the package script for each subdirectory.

## Atom

### Packages

- block-travel
- color-picker
- file-icons
- language-rspec
- merge-conflicts
- pane-manager
- pigments
- rails-transporter
- ruby-test
- toggle
- toggle-quotes

### Key bindings

#### Tab management

- **alt-q**: Close tab
- **alt-[**: Focus previous tab
- **alt-]**: Focus next tab
- **alt-shift-[**: Move tab to the left
- **alt-shift-]**: Move tab to the right

#### Pane management

- **alt-1**: Switch to layout 1 (one column)
- **alt-2**: Switch to layout 2 (two columns)
- **alt-3**: Switch to layout 3 (two columns, second one has two rows)
- **alt-;**: Focus previous pane
- **alt-'**: Focus next pane
- **alt-shift-;**: Move tab to previous pane
- **alt-shift-'**: Move tab to next pane

#### Cursor & selections

- **alt-left**: Move to beginning of line
- **alt-right**: Move to end of line
- **alt-shift-left**: Select to beginning of line
- **alt-shift-right**: Select to end of line
- **ctrl-up**: Move up (by block)
- **ctrl-down**: Move down (by block)
- **ctrl-shift-up**: Select previous block
- **ctrl-shift-down**: Select next block

#### Scrolling

- **alt-up**: Scroll up 10 lines (animated)
- **alt-down**: Scroll down 10 lines (animated)

#### Lines

- **shift-alt-up**: Move line up
- **shift-alt-down**: Move line down
- **ctrl-delete**: Delete line
- **ctrl-backspace**: Delete line

#### Text

- **ctrl-,**: Toggle word (true <-> false, and <-> or, etc.)
- **ctrl-'**: Toggle quotes ("" <-> '')

## TODO

- Bash config and aliases
- Vagrantfile and provision script

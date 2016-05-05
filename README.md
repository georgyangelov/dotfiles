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

## Bash config

Just look at the files in `home/.bash/`.


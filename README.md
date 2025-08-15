# GNU Guix, MacOS, and Doom Emacs Config Files

# GNU Guix symlinks

## System symlinks

cd /etc and symlink config.scm with
```
sudo ln -s /home/ymajan/dotfiles/geeks/config.scm
```

cd /etc/guix and symlink channels.scm with
```
sudo ln -s /home/ymajan/dotfiles/geeks/channels.scm
```

## User symlinks - none

```
guix home reconfigure ~/dotfiles/geeks/home.scm
```


# MacOS symlinks - stow

cd ~/dotfiles and symlink ~/.zprofile and ~/.zshrc with
```
stow zsh
```

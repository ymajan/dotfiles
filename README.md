# GNU Guix, MacOS, and Doom Emacs Config Files

# Step 1

## GNU Guix symlinks

### System symlinks

cd /etc and symlink config.scm with
```
sudo ln -s /home/ymajan/dotfiles/geeks/config.scm
```

cd /etc/guix and symlink channels.scm with
```
sudo ln -s /home/ymajan/dotfiles/geeks/channels.scm
```

### User symlinks - none

```
guix home reconfigure ~/dotfiles/geeks/home.scm
```


## MacOS symlinks - stow

cd ~/dotfiles and stow symlinks with
```
stow zsh-mac
```

# Step 2
Install Doom Emacs
Install nerd-fonts

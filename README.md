# WIP!

System symlinks
symlink /etc/config.scm to system.scm and /etc/guix/channels.scm to channels.scm

cd to /etc and symlink the expected config.scm
```
sudo ln -s /home/ymajan/count_fig/geeks/system.scm config.scm
```

cd to /etc/guix and symlink the expected channels.scm
```
sudo ln -s /home/ymajan/count_fig/geeks/system-channels.scm channels.scm
```

User symlinks
home.scm: there is is no expected location for guix home config, so leave as is
home-channels.scm: we configure home.scm to place a symlink from ~/.config/guix/channels.scm ~ home-channels.scm

Notes on Mackos

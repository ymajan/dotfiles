+++
title = "MacOS"
author = ["Jaynams Ahh"]
tags = ["macos"]
draft = false
+++

## Setup {#setup}

1.  Sign into iCloud and Apple ID, enable telemetry and app store
2.  Install [Homebrew](https://brew.sh/)
    ```bash
          /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```
3.  Sign into Github Desktop and clone this repo to ~/dotfiles
4.  cd code directory and install everything with \`brew bundle\`
    this will include App Store Apps via mas-cli
5.  install pipx packages
    ```bash
                cat /code/pipx-requirements.txt | xargs -I {} pipx install {}
    ```
6.  Install [Cardo](https://cardo-podcast.github.io/) Podcast App
7.  Install Claude Macos [Native Binary Install](https://docs.claude.com/en/docs/claude-code/setup)

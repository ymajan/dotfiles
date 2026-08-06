{ config, pkgs, ... }: {
  imports = [
    ./ssh.nix
  ];

  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    # basics
    wget
    curl
    
    # dev tools
    vim
    nixd
    nixpkgs-fmt
    tree-sitter

    # doom emacs dependencies
    ripgrep
    fd
    fontconfig
    coreutils
    shellcheck
    pandoc
  ];

  home.sessionPath = [
    "${config.home.homeDirectory}/.config/emacs/bin"
  ];

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    settings.user.name = "ymajan";
    settings.user.email = "github@ymajan.pw";
    signing.format = null;
  };
}

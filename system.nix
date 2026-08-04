{ self, ... }: {
  system.primaryUser = "ymajan";

  networking = {
    computerName = "Geekbook";
    hostName = "geekbook";
    localHostName = "geekbook";
  };

  nix.enable = false;

  users.users.ymajan = {
    name = "ymajan";
    home = "/Users/ymajan";
  };

  system.configurationRevision = self.rev or self.dirtyRev or null;
  system.stateVersion = 6;
  nixpkgs.hostPlatform = "aarch64-darwin";

  system.defaults = {
    dock.autohide = true;
    dock.mru-spaces = false;
    dock.show-recents = false;

    finder.AppleShowAllExtensions = true;
    finder.FXPreferredViewStyle = "clmv";
    finder.ShowPathbar = true;

    NSGlobalDomain.AppleShowAllExtensions = true;
    NSGlobalDomain.InitialKeyRepeat = 15;
    NSGlobalDomain.KeyRepeat = 2;
  };
}
{ self, ... }:

let
  bitwardenSshAgent =
    "/Users/ymajan/Library/Containers/com.bitwarden.desktop/Data/.bitwarden-ssh-agent.sock";
in
{
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

  # Make the Bitwarden agent available to GUI applications launched by macOS.
  launchd.user.envVariables.SSH_AUTH_SOCK = bitwardenSshAgent;

  # Pin server identities independently from the user authentication keys.
  programs.ssh.knownHosts = {
    komodo = {
      publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC/nMx8IIknCT5TaZlP1WHT+jcbpX5aW/mfY4VoVzaTa";
    };

    "jsi-root" = {
      publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIB0YyBKsh0UkH+6UHUHM+Ws1GfBZaGmHbCp8D2kHQWXC";
    };

    "jsi-agent" = {
      publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL/2LG9qR0EtnSVsYRPW1cBx2OLp82EynhiR1PPti1gH";
    };
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

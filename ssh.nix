{ pkgs, ... }:

let
  bitwardenSshAgent =
    "/Users/ymajan/Library/Containers/com.bitwarden.desktop/Data/.bitwarden-ssh-agent.sock";

  geekbookJsiPublicKey = pkgs.writeText "geekbook-jsi.pub" ''
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOmjWOZG2if5plsLDOfLvvaCUyhrj9ilZ1Bi1sd6OAhm geekbook-jsi
  '';

  geekbookKomodoPublicKey = pkgs.writeText "geekbook-komodo.pub" ''
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAMqWCDysZYwCav2oDEmUhucMtxDoSYbp1Qs6BOfxEZs geekbook-komodo
  '';
in
{
  home.sessionVariables.SSH_AUTH_SOCK = bitwardenSshAgent;

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    matchBlocks = {
      "*" = {
        forwardAgent = false;
        addKeysToAgent = "no";
      };

      komodo = {
        hostname = "87.99.129.52";
        user = "ymajan";
        identityAgent = bitwardenSshAgent;
        identityFile = "${geekbookKomodoPublicKey}";
        identitiesOnly = true;
        forwardAgent = false;
        extraOptions.HostKeyAlias = "komodo";
      };

      "jsi-root" = {
        hostname = "178.156.176.171";
        user = "ymajan";
        identityAgent = bitwardenSshAgent;
        identityFile = "${geekbookJsiPublicKey}";
        identitiesOnly = true;
        forwardAgent = false;
        extraOptions.HostKeyAlias = "jsi-root";
      };

      "jsi-agent" = {
        hostname = "178.156.201.205";
        user = "ymajan";
        identityAgent = bitwardenSshAgent;
        identityFile = "${geekbookJsiPublicKey}";
        identitiesOnly = true;
        forwardAgent = false;
        extraOptions.HostKeyAlias = "jsi-agent";
      };
    };
  };
}

{ ... }: {
  homebrew = {
    enable = true;
    onActivation.cleanup = "none";
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
    enableZshIntegration = true;

    taps = [
      "railwaycat/emacsmacport"
    ];

    brews = [
      "mas"
      "node"
      "awscli"
      "rclone"
      "bitwarden-cli"
    ];

    casks = [
      # Browsers
      "helium-browser"
      "mullvad-browser"
      "waterfox"

      # Editors & development
      "beekeeper-studio"
      "github"
      "railwaycat/emacsmacport/emacs-mac-spacemacs-icon"
      "vscodium"

      # AI assistants
      "chatgpt"
      "google-gemini"

      # Messaging & meetings
      "discord"
      "microsoft-teams"
      "slack"
      "whatsapp"
      "zoom"

      # Email
      "mailspring"
      "microsoft-outlook"

      # Office & documents
      "microsoft-excel"
      "microsoft-powerpoint"
      "microsoft-word"
      "onlyoffice"

      # Notes, research & learning
      "anki"
      "obsidian"
      "zotero"

      # Tasks & productivity
      "activitywatch"
      "chiri"
      "homerow"
      "keycombiner"

      # File management, transfer & sync
      "keka"
      "localsend"
      "nimble-commander"
      "seafile-client"

      # Audio, video & gaming
      "finetune"
      "iina"
      "spotify"
      "steam"

      # System, remote access & device utilities
      "altserver"
      "anydesk"
      "appcleaner"
    ];

    masApps = {
      "KDE Connect" = 1580245991;
      #"Perplexity: Ask Anything" = 6714467650;
      #"Emotiv" = 6483688285;
      #"Emotiv Studio" = 6751176117;
      #"Canary Mail App" = 1236045954;
      #"Dove - AI Email" = 6749230975;
      "Bitwarden" = 1352778147; # macos got better ssh and auth connectivity
    };
  };
}
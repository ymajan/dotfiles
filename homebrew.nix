{ ... }: {
  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;

    taps = [
      "railwaycat/emacsmacport"
    ];

    brews = [
      "mas"
      "node"
      "firefoxpwa"
      "awscli"
      "exiftool"
      "ansible"
      "rclone"
    ];

    casks = [
      "railwaycat/emacsmacport/emacs-mac-spacemacs-icon"
      "firefox"
      "claude"
      "claude-code"
      "spotify"
      "discord"
      "proton-pass"
      "protonvpn"
      "proton-drive"
      "proton-mail"
      "proton-mail-bridge"
      "whatsapp"
      "activitywatch"
      "dana-dex"
      "onlyoffice"
      "finetune"
      # "google-chrome" actively mining you - use helium
      "appcleaner"
      "eqmac"
      "seafile-client"
      "seadrive"
      # "ibkr" hella glitchy
      "trader-workstation"
      "anydesk"
      "xnviewmp"
      "iina"
      "transmission"
      "antigravity"
      "github"
      "comet"
      "beekeeper-studio"
      "thunderbird"
      "steam"
      "helium-browser"
      "orion"
      "vscodium"
      "zed"
      "logmein-hamachi"
      "logmein-client"
      "slack"
      # "microsoft-office" - Word, Excel, PowerPoint, Outlook, OneNote, and OneDrive altogether
      "microsoft-word"
      "microsoft-excel"
      "microsoft-powerpoint"
      "microsoft-teams"
      "microsoft-outlook"
      "zoom"
      "homerow"
      "waterfox"
      "zen"
      "mullvad-browser"
      "floorp"
      "opencloud"
      "obsidian"
      "chatgpt"
      "readdle-spark" # didn't accept JSI
      "bitwarden"
    ];

    masApps = {
      "KDE Connect" = 1580245991;
      "Perplexity: Ask Anything" = 6714467650;
      "Emotiv" = 6483688285;
      "Emotiv Studio" = 6751176117;
      "Canary Mail App" = 1236045954;
      "Dove - AI Email" = 6749230975;
    };
  };
}
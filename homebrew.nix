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
      "firefoxpwa"
      "awscli"
      "exiftool"
      "ansible"
      "rclone"
      "bitwarden-cli"
    ];

    casks = [
      # archive
      # "eqmac"
      #"seadrive"
      #"mullvad-browser"
      #"floorp"
      #"opencloud"
      # "firefox"
      # "claude"
      # "claude-code"
      # "ibkr" hella glitchy
      #"trader-workstation"
      #"xnviewmp"
      #"iina"
      #"transmission"
      #"comet"
      #"antigravity"
      #"thunderbird"
      #"steam"
      #"orion"
      #"zed"
      #"logmein-hamachi"
      #"logmein-client"
      #"readdle-spark" # didn't accept JSI
      # "protonvpn"
      # "proton-drive"
      # "proton-mail"
      # "proton-mail-bridge"
      # "microsoft-office" - Word, Excel, PowerPoint, Outlook, OneNote, and OneDrive altogether
      # "google-chrome" actively mining you - use helium
      # "activitywatch"
      "microsoft-outlook"
      "discord"
      "railwaycat/emacsmacport/emacs-mac-spacemacs-icon"
      "anki"
      "anydesk"
      "spotify"
      "keka"
      "proton-pass"
      "whatsapp"
      "dana-dex"
      "onlyoffice"
      "finetune"
      "appcleaner"
      "seafile-client"
      "github"
      "beekeeper-studio"
      "vscodium"
      "waterfox"
      "helium-browser"
      "slack"
      "microsoft-word"
      "microsoft-excel"
      "microsoft-powerpoint"
      "microsoft-teams"
      "zoom"
      "homerow"
      "obsidian"
      "chatgpt"
      "codex"
      "claude"
      "google-gemini"
      "mailspring"
      "y3owk1n/tap/neru"
      "chroncal"
    ];

    masApps = {
      "KDE Connect" = 1580245991;
      #"Perplexity: Ask Anything" = 6714467650;
      #"Emotiv" = 6483688285;
      #"Emotiv Studio" = 6751176117;
      #"Canary Mail App" = 1236045954;
      #"Dove - AI Email" = 6749230975;
      "Bitwarden" = 1352778147;
    };
  };
}
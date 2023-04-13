{ pkgs, ... }:
{
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  system.defaults.dock.autohide = true;

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToEscape = true;
  };

  homebrew = {
    enable = true;

    taps = [
      "railwaycat/emacsmacport"
    ];

    casks = [
      "1password"
      "discord"
      "element"
      "emacs-mac"
      "firefox"
      "gimp"
      "iterm2"
      "itsycal"
      "keepassxc"
      "nextcloud"
      "rectangle"
      "slack"
      "spotify"
      "steam"
      "telegram"
      "todoist"
      "vscodium"
      "zoom"
    ];

    masApps = {
      "tailscale" = 1475387142;
      "meeter" = 1510445899;
    };
  };
}

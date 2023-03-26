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

    casks = [
      "discord"
      "firefox"
      "keepassxc"
      "nextcloud"
      "spotify"
      "iterm2"
      "element"
      "rectangle"
    ];

    masApps = {
      "tailscale" = 1475387142;
    };
  };
}

{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "ben";
  home.homeDirectory = "/Users/ben";

  home.packages = [
    pkgs.bat
    pkgs.clang
    pkgs.direnv
    pkgs.dogdns
    pkgs.duf
    pkgs.eza
    pkgs.fd
    pkgs.flyctl
    pkgs.fzf
    pkgs.gh
    pkgs.gore
    pkgs.gotools
    pkgs.htop
    pkgs.jq
    pkgs.mpv
    pkgs.ncdu
    pkgs.neovim
    pkgs.redis
    pkgs.ripgrep
    pkgs.shellcheck
    pkgs.tree
    pkgs.watch
    pkgs.yt-dlp
    pkgs.zoxide
  ];

  programs.git = {
    enable = true;
    userName = "Ben Iofel";
    userEmail = "ben@iofel.me";
    delta.enable = true;
    extraConfig = {
      pull.rebase = true;
      github.user = "benwaffle";
    };
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

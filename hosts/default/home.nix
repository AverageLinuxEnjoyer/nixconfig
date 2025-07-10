{ config, pkgs, inputs, lib, ... }:

{
  imports = [
    ../../modules/gui/hyprland.nix    
    ../../modules/gui/waybar.nix    
    ../../modules/gui/rofi.nix
    ../../modules/system/helix.nix
    ../../modules/zellij.nix
    ../../modules/firefox.nix
    ../../modules/kitty.nix
    ../../modules/fastfetch.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home = {
    username = "averagelinuxenjoyer";
    homeDirectory = "/home/averagelinuxenjoyer";
    # dont
    stateVersion = "24.05";

    packages = with pkgs; [
      activate-linux
      audacity
      hyprpicker
      thunderbird
      hyprshot
      ungoogled-chromium
      discord
      libsForQt5.okular
      insomnia
      postman
      pavucontrol
      vlc
      jellyfin-ffmpeg
      teams-for-linux
      slack
      qbittorrent
      rnote
      obs-studio
      obs-studio-plugins.input-overlay
      steam
      steam-run
      wally-cli
      tor-browser-bundle-bin
      cliphist
      lazygit
      mongosh
      mongodb-compass
      neofetch
      tldr
      ngrok
      phinger-cursors
      wl-clipboard
      zoom-us
      tridactyl-native
      nixd
      pgadmin4
      postgresql
      wiki-tui
      yq
    ];

    # pointerCursor = lib.mkForce {
    #   name = "phinger-cursors-dark";
    #   package = pkgs.phinger-cursors;
    #   size = 32;
    #   gtk.enable = true;
    # };

    sessionVariables = {
      EDITOR = "hx";
      HYPRSHOT_DIR = "${config.home.homeDirectory}/Screenshots";
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager = {
    enable = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [
      "--cmd cd"
    ];
  };
}

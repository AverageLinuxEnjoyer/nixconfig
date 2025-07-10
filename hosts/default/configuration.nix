# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/system/zsh.nix
      ../../modules/system/wireguard.nix
      ../../modules/stylix.nix
      inputs.home-manager.nixosModules.default
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
  boot.kernelModules = [ "v4l2loopback" ];

  hardware.keyboard.zsa.enable = true;
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes"];

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.extraHosts =
  ''
    10.10.48.24 iam-dnata-sit.airportlabs.com
    10.10.48.24 iam-dnata-gql-sit.airportlabs.com
    10.10.48.24 iam-dnata-api-sit.airportlabs.com
    10.10.48.24 iam-dnata-api-grpc-sit.airportlabs.com
    10.10.48.24 iam-dnata-login-sit.airportlabs.com

    10.10.48.24 adr-dnatadxbaodb-sit.airportlabs.com
    10.10.48.24 aodb-dnatadxb-alerts-sit.airportlabs.com
    10.10.48.24 aodb-dnatadxb-audit-sit.airportlabs.com
    10.10.48.24 aodb-dnatadxb-audit-api-sit.airportlabs.com
    10.10.48.24 aodb-dnatadxb-flights-sit.airportlabs.com
    10.10.48.24 aodb-dnatadxb-flights-api-sit.airportlabs.com
    10.10.48.24 aodb-dnatadxb-gql-sit.airportlabs.com
    10.10.48.24 aodb-dnatadxb-mdm-sit.airportlabs.com
    10.10.48.24 aodb-dnatadxb-mdm-api-sit.airportlabs.com
    10.10.48.24 aodb-dnatadxb-re-applier-sit.airportlabs.com
    10.10.48.24 aodb-dnatadxb-rule-engine-sit.airportlabs.com

    10.10.48.24 adr-dnatadwcaodb-sit.airportlabs.com
    10.10.48.24 aodb-dnatadwc-alerts-sit.airportlabs.com
    10.10.48.24 aodb-dnatadwc-audit-sit.airportlabs.com
    10.10.48.24 aodb-dnatadwc-audit-api-sit.airportlabs.com
    10.10.48.24 aodb-dnatadwc-flights-sit.airportlabs.com
    10.10.48.24 aodb-dnatadwc-flights-api-sit.airportlabs.com
    10.10.48.24 aodb-dnatadwc-gql-sit.airportlabs.com
    10.10.48.24 aodb-dnatadwc-mdm-sit.airportlabs.com
    10.10.48.24 aodb-dnatadwc-mdm-api-sit.airportlabs.com
    10.10.48.24 aodb-dnatadwc-re-applier-sit.airportlabs.com
    10.10.48.24 aodb-dnatadwc-rule-engine-sit.airportlabs.com
  '';

  # Set your time zone.
  time.timeZone = "Europe/Bucharest";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ro_RO.UTF-8";
    LC_IDENTIFICATION = "ro_RO.UTF-8";
    LC_MEASUREMENT = "ro_RO.UTF-8";
    LC_MONETARY = "ro_RO.UTF-8";
    LC_NAME = "ro_RO.UTF-8";
    LC_NUMERIC = "ro_RO.UTF-8";
    LC_PAPER = "ro_RO.UTF-8";
    LC_TELEPHONE = "ro_RO.UTF-8";
    LC_TIME = "ro_RO.UTF-8";
  };

  fonts.packages = with pkgs; [
    roboto-mono
    font-awesome
    fira-code
    fira-code-symbols
    noto-fonts
    garamond-libre
    gyre-fonts
  ];

  programs.adb.enable = true;

  environment.sessionVariables = {
    # If your cursor becomes invisible
    WLR_NO_HARDWARE_CURSORS = "1";
    # Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
  };

  hardware = {
    # Opengl
    graphics.enable = true;

    # Most wayland compositors need this
    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      # package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
      #   # This is the latest driver with the CVE patches + explicit sync
      #   version = "555.52.04";
      #   sha256_64bit = "sha256-nVOubb7zKulXhux9AruUTVBQwccFFuYGWrU1ZiakRAI=";
      #   sha256_aarch64 = "sha256-Kt60kTTO3mli66De2d1CAoE3wr0yUbBe7eqCIrYHcWk=";
      #   openSha256 = "sha256-wDimW8/rJlmwr1zQz8+b1uvxxxbOf3Bpk060lfLKuy0=";
      #   settingsSha256 = "sha256-PMh5efbSEq7iqEMBr2+VGQYkBG73TGUh6FuDHZhmwHk=";
      #   persistencedSha256 = "sha256-KAYIvPjUVilQQcD04h163MHmKcQrn2a8oaXujL2Bxro=";
      # };
      open = true;
      modesetting.enable = true;
      powerManagement.enable = true;
    };
  };

  services.xserver.videoDrivers = ["nvidia"];

  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.averagelinuxenjoyer = {
    isNormalUser = true;
    description = "AverageLinuxEnjoyer";
    extraGroups = [ "adbusers" "networkmanager" "wheel" "docker"];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  users.defaultUserShell = pkgs.zsh;

  # A fuse filesystem that dynamically populates contents of /bin and /usr/bin/ so that it contains all executables from the PATH of the requesting process. This allows executing FHS based programs on a non-FHS system. For example, this is useful to execute shebangs on NixOS that assume hard coded locations like /bin or /usr/bin etc.
  services.envfs.enable = true;

  # services.gnome.gnome-keyring.enable = true;
  # security.pam.services.Hyprland.enableGnomeKeyring = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "averagelinuxenjoyer" = import ./home.nix;
    };
    backupFileExtension = "backup";
  };

  environment.systemPackages = with pkgs; [
    brightnessctl
    fzf
    git
    lm_sensors
    hdparm
    tree

    unzip
    unrar

    inputs.helix-editor.packages.${pkgs.system}.helix
    libgnome-keyring
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    xwayland.enable = true;
  };

  # XDG portal
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # dont
  system.stateVersion = "23.11";
}

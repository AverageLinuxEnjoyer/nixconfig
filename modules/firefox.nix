{ config, pkgs, inputs, ... }:

let
  lock-false = {
    Value = false;
    Status = "locked";
  };
  lock-true = {
    Value = true;
    Status = "locked";
  };
in
{
  programs = {
    firefox = {
      enable = true;
      package = pkgs.wrapFirefox pkgs.firefox-unwrapped {      
        extraPolicies = {
          DisableTelemetry = true;
          DisableFirefoxStudies = true;
          EnableTrackingProtection = {
            Value= true;
            Locked = true;
            Cryptomining = true;
            Fingerprinting = true;
          };
          # add policies here...

          /* ---- EXTENSIONS ---- */
          ExtensionSettings = {
            # "*".installation_mode = "blocked"; # blocks all addons except the ones specified below
            # uBlock Origin:
            "uBlock0@raymondhill.net" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
              installation_mode = "force_installed";
            };
            "addon@darkreader.org" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/addon@darkreader.org/latest.xpi";
              installation_mode = "force_installed";
            };
            "tridactyl.vim@cmcaine.co.uk" = {
              install_url = "ttps://addons.mozilla.org/firefox/downloads/latest/tridactyl.vim@cmcaine.co.uk/latest.xpi";
              installation_mode = "force_installed";
            };
            "firefox-compact-dark@mozilla.org" = {
              install_url = "ttps://addons.mozilla.org/firefox/downloads/latest/firefox-compact-dark@mozilla.org/latest.xpi";
              installation_mode = "force_installed";
            };
            # add extensions here...
          };
  
          /* ---- PREFERENCES ---- */
          # Set preferences shared by all profiles.
          Preferences = { 
            # "browser.contentblocking.category" = { Value = "strict"; Status = "locked"; };
            # "extensions.pocket.enabled" = lock-false;
            # "extensions.screenshots.disabled" = lock-true;
            # add global preferences here...
          };
        };
      };

      nativeMessagingHosts = [
        pkgs.tridactyl-native
      ];

      /* ---- PROFILES ---- */
      # Switch profiles via about:profiles page.
      # For options that are available in Home-Manager see
      # https://nix-community.github.io/home-manager/options.html#opt-programs.firefox.profiles
      profiles ={
        ale= {           # choose a profile name; directory is /home/<user>/.mozilla/firefox/profile_0
          id = 0;               # 0 is the default profile; see also option "isDefault"
          name = "ale";   # name as listed in about:profiles
          isDefault = true;     # can be omitted; true if profile ID is 0
          settings = {          # specify profile-specific preferences here; check about:config for options
            "browser.newtabpage.activity-stream.feeds.section.highlights" = false;
            # "browser.startup.homepage" = "https://nixos.org";
            # "browser.newtabpage.pinned" = [{
            #   title = "NixOS";
            #   url = "https://nixos.org";
            # }];
            # add preferences for profile_0 here...
          };
        };
        second = {
          id = 1;
          name = "second";
          isDefault = false;
          settings = {
            # "browser.newtabpage.activity-stream.feeds.section.highlights" = true;
            # "browser.startup.homepage" = "https://ecosia.org";
            # add preferences for profile_1 here...
          };
        };
      # add profiles here...
      };
    };
  };  
}

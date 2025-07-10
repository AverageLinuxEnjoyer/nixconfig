{ config, pkgs, inputs, ... }:

{
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark-dark.yaml";
    image = ../wallpapers/street-tn.png;
    polarity = "dark";

    cursor = {
      name = "phinger-cursors-dark";
      package = pkgs.phinger-cursors;
      size = 24;
    };
  };
}

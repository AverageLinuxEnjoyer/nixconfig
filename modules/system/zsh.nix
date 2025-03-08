{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    zsh
  ];

  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    histSize = 10000;
    ohMyZsh = {
      enable = true;
      plugins = [ "git" "vi-mode" ];
      theme = "robbyrussell";
    };
    shellAliases = {
      ll = "ls -l";
      f = "fzf";
      zj = "zellij --config /home/averagelinuxenjoyer/.config/zellij/config.kdl -l welcome";
    };

    # doesn't actually work
    shellInit = ''
      fastfetch
      bindkey '^H' backward-kill-word
      bindkey '5~' kill-word

      export EDITOR=hx
      export VISUAL="$EDITOR"

      eval "$(zoxide init zsh --cmd cd)"
    '';
  };
}

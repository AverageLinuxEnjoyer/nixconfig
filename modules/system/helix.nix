{ config, pkgs, inputs, lib, ... }:

{
  programs.helix = {
    enable = true;

    settings = {
      # theme = lib.mkForce "github_dark_high_contrast_transparent";

      editor = {
        line-number = "relative";
        bufferline = "multiple";
        mouse = false;
        jump-label-alphabet = "rstneiagmobcdfhjklpuvwxyzq";

        lsp.display-inlay-hints = true;

        soft-wrap.enable = true;

        inline-diagnostics = {
          cursor-line = "hint";
          other-lines = "error";
        };

        file-picker.hidden = false;
      };

      keys = {
        normal = {
          "X" = ["extend_line_up" "extend_to_line_bounds"];
          "A-x" = "extend_to_line_bounds";
          "esc" = ["collapse_selection" "keep_primary_selection"];
        };

        select = {
          "X" = ["extend_line_up" "extend_to_line_bounds"];
          "A-x" = "extend_to_line_bounds";
        };
      };
    };

    languages = {
      language-server.rust-analyzer.config.proc-macro.enable = true;

      language = [
        {
          name = "typst";
          formatter = {
            command = "typstfmt";
            args = ["--output" "-"];
          };
          auto-format = true;
        }
        {
          name = "typescript";
          formatter = {
            command = "prettier";
            args = ["--parser" "typescript"];
          };
          # auto-format = true
         }
      ];
    };

    themes = {
      github_dark_high_contrast_transparent = {
        inherits = "github_dark_high_contrast";
        ui.background = {
          bg = "#241b26";
        };
      };
    };
  };
}

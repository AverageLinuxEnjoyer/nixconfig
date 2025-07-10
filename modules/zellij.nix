{ config, pkgs, inputs, ... }:

{
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      plugins = {
        tab-bar = { path = "tab-bar"; };
        status-bar = { path = "status-bar"; };
        strider = { path = "strider"; };
        compact-bar = { path = "compact-bar"; };
        session-manager = { path = "session-manager"; };
      };

      keybinds = {
        normal = {
          # Uncomment this and adjust key if using copy_on_select=false
          # "Alt c" = [ "Copy" ];
        };
        locked = {
          "bind \"Ctrl g\"" = { SwitchToMode = "Normal"; };
        };
        resize = {
          "bind \"Ctrl n\"" = { SwitchToMode = "Normal"; };
          "bind \"h\"" = { Resize = "Increase Left"; };
          "bind \"j\"" = { Resize = "Increase Down"; };
          "bind \"k\"" = { Resize = "Increase Up"; };
          "bind \"l\"" = { Resize = "Increase Right"; };
          "bind \"H\"" = { Resize = "Decrease Left"; };
          "bind \"J\"" = { Resize = "Decrease Down"; };
          "bind \"K\"" = { Resize = "Decrease Up"; };
          "bind \"L\"" = { Resize = "Decrease Right"; };
          "bind \"=\"" = { Resize = "Increase"; };
          "bind \"-\"" = { Resize = "Decrease"; };
        };
        pane = {
          "bind \"Ctrl p\"" = { SwitchToMode = "Normal"; };
          "bind \"h\"" = { MoveFocus = "Left"; };
          "bind \"l\"" = { MoveFocus = "Right"; };
          "bind \"j\"" = { MoveFocus = "Down"; };
          "bind \"k\"" = { MoveFocus = "Up"; };
          "bind \"p\"" = { SwitchFocus = {}; };
          "bind \"n\"" = { NewPane = {}; SwitchToMode = "Normal"; };
          "bind \"d\"" = { NewPane = "Down"; SwitchToMode = "Normal"; };
          "bind \"r\"" = { NewPane = "Right"; SwitchToMode = "Normal"; };
          "bind \"x\"" = { CloseFocus = {}; SwitchToMode = "Normal"; };
          "bind \"f\"" = { ToggleFocusFullscreen = {}; SwitchToMode = "Normal"; };
          "bind \"z\"" = { TogglePaneFrames = {}; SwitchToMode = "Normal"; };
          "bind \"w\"" = { ToggleFloatingPanes = {}; SwitchToMode = "Normal"; };
          "bind \"e\"" = { TogglePaneEmbedOrFloating = {}; SwitchToMode = "Normal"; };
          "bind \"c\"" = { SwitchToMode = "RenamePane"; PaneNameInput = 0; };
        };
        move = {
          "bind \"Ctrl h\"" = { SwitchToMode = "Normal"; };
          "bind \"n\"" = { MovePane = {}; };
          "bind \"p\"" = { MovePaneBackwards = {}; };
          "bind \"h\"" = { MovePane = "Left"; };
          "bind \"j\"" = { MovePane = "Down"; };
          "bind \"k\"" = { MovePane = "Up"; };
          "bind \"l\"" = { MovePane = "Right"; };
        };
        tab = {
          "bind \"Ctrl t\"" = { SwitchToMode = "Normal"; };
          "bind \"r\"" = { SwitchToMode = "RenameTab"; TabNameInput = 0; };
          "bind \"h\"" = { GoToPreviousTab = {}; };
          "bind \"l\"" = { GoToNextTab = {}; };
          "bind \"n\"" = { NewTab = {}; SwitchToMode = "Normal"; };
          "bind \"x\"" = { CloseTab = {}; SwitchToMode = "Normal"; };
          "bind \"s\"" = { ToggleActiveSyncTab = {}; SwitchToMode = "Normal"; };
          "bind \"b\"" = { BreakPane = {}; SwitchToMode = "Normal"; };
          "bind \"]\"" = { BreakPaneRight = {}; SwitchToMode = "Normal"; };
          "bind \"[\"" = { BreakPaneLeft = {}; SwitchToMode = "Normal"; };
          "bind \"Tab\"" = { ToggleTab = {}; };
          "bind \"1\"" = { GoToTab = 1; SwitchToMode = "Normal"; };
          "bind \"2\"" = { GoToTab = 2; SwitchToMode = "Normal"; };
          "bind \"3\"" = { GoToTab = 3; SwitchToMode = "Normal"; };
          "bind \"4\"" = { GoToTab = 4; SwitchToMode = "Normal"; };
          "bind \"5\"" = { GoToTab = 5; SwitchToMode = "Normal"; };
          "bind \"6\"" = { GoToTab = 6; SwitchToMode = "Normal"; };
          "bind \"7\"" = { GoToTab = 7; SwitchToMode = "Normal"; };
          "bind \"8\"" = { GoToTab = 8; SwitchToMode = "Normal"; };
          "bind \"9\"" = { GoToTab = 9; SwitchToMode = "Normal"; };
        };
        scroll = {
          "bind \"Ctrl s\"" = { SwitchToMode = "Normal"; };
          "bind \"e\"" = { EditScrollback = {}; SwitchToMode = "Normal"; };
          "bind \"s\"" = { SwitchToMode = "EnterSearch"; SearchInput = 0; };
          "bind \"Ctrl c\"" = { ScrollToBottom = {}; SwitchToMode = "Normal"; };
          "bind \"j\"" = { ScrollDown = {}; };
          "bind \"k\"" = { ScrollUp = {}; };
          "bind \"Ctrl f\"" = { PageScrollDown = {}; };
          "bind \"Ctrl b\"" = { PageScrollUp = {}; };
          "bind \"d\"" = { HalfPageScrollDown = {}; };
          "bind \"u\"" = { HalfPageScrollUp = {}; };
        };
        session = {
          "bind \"Ctrl x\"" = { SwitchToMode = "Normal"; };
          "bind \"Ctrl s\"" = { SwitchToMode = "Scroll"; };
          "bind \"d\"" = { Detach = {}; };
          "bind \"w\"" = {
            "LaunchOrFocusPlugin \"zellij:session-manager\"" = {
              floating = true;
              move_to_focused_tab = true;
            };
            SwitchToMode = "Normal";
          };
        };
        tmux = {
          "bind \"[\"" = { SwitchToMode = "Scroll"; };
          "bind \"Ctrl b\"" = { Write = 2; SwitchToMode = "Normal"; };
          "bind \"\\\"\"" = { NewPane = "Down"; SwitchToMode = "Normal"; };
          "bind \"%\"" = { NewPane = "Right"; SwitchToMode = "Normal"; };
          "bind \"z\"" = { ToggleFocusFullscreen = {}; SwitchToMode = "Normal"; };
          "bind \"c\"" = { NewTab = {}; SwitchToMode = "Normal"; };
          "bind \"p\"" = { GoToPreviousTab = {}; SwitchToMode = "Normal"; };
          "bind \"n\"" = { GoToNextTab = {}; SwitchToMode = "Normal"; };
          "bind \"h\"" = { MoveFocus = "Left"; SwitchToMode = "Normal"; };
          "bind \"l\"" = { MoveFocus = "Right"; SwitchToMode = "Normal"; };
          "bind \"j\"" = { MoveFocus = "Down"; SwitchToMode = "Normal"; };
          "bind \"k\"" = { MoveFocus = "Up"; SwitchToMode = "Normal"; };
          "bind \"o\"" = { FocusNextPane = {}; };
          "bind \"d\"" = { Detach = {}; };
          "bind \"Space\"" = { NextSwapLayout = {}; };
          "bind \"x\"" = { CloseFocus = {}; SwitchToMode = "Normal"; };
        };

        "shared_except \"locked\"" = {
          "bind \"Ctrl g\"" = { SwitchToMode = "Locked"; };
          "bind \"Ctrl q\"" = { Quit = {}; };
          "bind \"Alt n\"" = { NewPane = {}; };
          "bind \"Alt h\" \"Alt Left\"" = { MoveFocusOrTab = "Left"; };
          "bind \"Alt l\" \"Alt Right\"" = { MoveFocusOrTab = "Right"; };
          "bind \"Alt j\" \"Alt Down\"" = { MoveFocus = "Down"; };
          "bind \"Alt k\" \"Alt Up\"" = { MoveFocus = "Up"; };
          "bind \"Alt =\" \"Alt +\"" = { Resize = "Increase"; };
          "bind \"Alt -\"" = { Resize = "Decrease"; };
          "bind \"Alt [\"" = { PreviousSwapLayout = {}; };
          "bind \"Alt ]\"" = { NextSwapLayout = {}; };
        };
        "shared_except \"normal\" \"locked\"" = {
          "bind \"Enter\" \"Esc\"" = { SwitchToMode = "Normal"; };
        };
        "shared_except \"pane\" \"locked\"" = {
          "bind \"Ctrl p\"" = { SwitchToMode = "Pane"; };
        };
        "shared_except \"resize\" \"locked\"" = {
          "bind \"Ctrl n\"" = { SwitchToMode = "Resize"; };
        };
        "shared_except \"scroll\" \"locked\"" = {
          "bind \"Ctrl s\"" = { SwitchToMode = "Scroll"; };
        };
        "shared_except \"session\" \"locked\"" = {
          "unbind \"Ctrl o\"" = {};
          "bind \"Ctrl x\"" = { SwitchToMode = "Session"; };
        };
        "shared_except \"tab\" \"locked\"" = {
          "bind \"Ctrl t\"" = { SwitchToMode = "Tab"; };
        };
        "shared_except \"move\" \"locked\"" = {
          "bind \"Ctrl h\"" = { SwitchToMode = "Move"; };
        };
        "shared_except \"tmux\" \"locked\"" = {
          "bind \"Ctrl b\"" = { SwitchToMode = "Tmux"; };
        };
      };
    };
  };
}

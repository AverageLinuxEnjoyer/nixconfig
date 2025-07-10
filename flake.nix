{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    helix-editor = {
      url = "github:helix-editor/helix";
      flake = true;
    };

    hyprland.url = "github:hyprwm/Hyprland";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    stylix = {
      url = "github:danth/stylix";
      # url = "github:danth/stylix/release-24.11";

      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    # hy3 = {
    #   url = "github:outfoxxed/hy3";
    #   inputs.hyprland.follows = "hyprland";
    # };

    # hyprchroma = {
    #   url = "github:alexhulbert/hyprchroma";
    #   inputs.hyprland.follows = "hyprland";
    # };
  };

  outputs = { self, nixpkgs, ... } @inputs: {
    nixosConfigurations = {
      default = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/default/configuration.nix
          inputs.home-manager.nixosModules.default
          inputs.stylix.nixosModules.stylix
        ];
      };
    };
  };
}

{
  description = "Configuration of CPSC-M-22108";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
    }:
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#CPSC-M-22108
      darwinConfigurations."CPSC-M-22108" = nix-darwin.lib.darwinSystem {
        modules = [ ./configuration.nix ];
        specialArgs = { inherit inputs; };
      };

      # Expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations."CPSC-M-22108".pkgs;
    };
}

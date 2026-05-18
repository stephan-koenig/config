{
  pkgs,
  lib,
  inputs,
  ...
}:
{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [
    pkgs.vim
  ];

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;

  security.pam.services.sudo_local.touchIdAuth = true;

  # Set Git commit hash for darwin-version.
  system = {
    configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

    defaults = {
      dock.autohide = true;
      finder.AppleShowAllExtensions = true;
      finder.FXPreferredViewStyle = "clmv";
    };

    primaryUser = "stephankoenig";

    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    stateVersion = 6;
  };
  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
}

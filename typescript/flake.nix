{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    inputs:
    inputs.flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = (import (inputs.nixpkgs) { inherit system; });
      in
      {
        devShell = pkgs.mkShell {
          packages = with pkgs; [
            nodejs_22
            nodePackages.pnpm
            nodePackages.typescript
            #Installed via nixCats
            #nodePackages.typescript-language-server
          ];

          #install dependencies form other packages
          #inputsFrom = [];

          shellHook = ''
            exec zsh
          '';
          # Any Value not known to mkshell will set a env valiable
          #EXAMPLEVAR1 = "Example Val 1";
        };
      }
    );
}

{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
        system = "x86_64-linux";
        pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
        };
    in {
         devShells.${system}.default = pkgs.mkShell {
            buildInputs = with pkgs; [
                typescript
                nodejs
                nodePackages_latest.live-server 
                nodePackages_latest.typescript-language-server
                vscode-langservers-extracted
            ];
         };
    };
}

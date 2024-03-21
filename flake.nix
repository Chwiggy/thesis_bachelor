{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
    let systems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];
    eachSystem = f:
      nixpkgs.lib.genAttrs systems (system:
        f nixpkgs.legacyPackages.${system});

  in {
    devShells = eachSystem (pkgs: {
      default = pkgs.mkShell{
        packages = with pkgs;[
          typst
          typst-lsp
        ];
      };
    });
  };
}

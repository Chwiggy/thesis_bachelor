# Nix shell configuration, use nix-shell to start a shell in the terminal
{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  # nativeBuildInputs is usually what you want -- tools you need to run
  nativeBuildInputs = with pkgs.buildPackages; [
    typst
  ];
}
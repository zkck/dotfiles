let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-23.11";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

pkgs.mkShellNoCC {
  packages = with pkgs; [
    tmux
    lazygit
    fish
    zoxide
    dprint
    tree-sitter
    lua-language-server
  ];

  shellHook = "tmux";
}


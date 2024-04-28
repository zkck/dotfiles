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
    neovim
    tree-sitter
    lua-language-server
    kubectl
    k9s

    go
    gopls
  ];

  shellHook = "tmux";

  EDITOR = "nvim";
}


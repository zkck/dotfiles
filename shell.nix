let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-23.11";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

pkgs.mkShell {
  packages = with pkgs; [
    tmux
    lazygit
    git
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

    cargo
    rust-analyzer
  ];

  shellHook = "tmux";

  EDITOR = "nvim";

  # https://nixos.wiki/wiki/Development_environment_with_nix-shell#Troubleshooting
  NIX_ENFORCE_PURITY = "0";
}


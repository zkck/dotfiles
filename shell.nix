let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-23.11";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

pkgs.mkShell {
  packages = with pkgs; [

    # core stack
    tmux
    git
    fish
    neovim

    # for editing neovim config
    lua-language-server

    # k8s
    kubectl
    k9s

    # shell utilities
    zoxide
    lazygit
    fzf
    fd
    less
    ripgrep

    # editing
    dprint
    tree-sitter

    # golang
    go
    gopls

    # rust
    cargo
    rust-analyzer

    # python
    python3
    pyright
  ];

  shellHook = "tmux";

  EDITOR = "nvim";

  # fix for cargo https://nixos.wiki/wiki/Development_environment_with_nix-shell#Troubleshooting
  NIX_ENFORCE_PURITY = "0";

  # fix for git https://github.com/NixOS/nixpkgs/issues/58132
  GIT_SSH = "/usr/bin/ssh";
}


{
    inputs = {
    nixpkgs.url      = "github:NixOS/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
    flake-utils.url  = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, rust-overlay, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        overlays = [ (import rust-overlay) ];
        pkgs = import nixpkgs {
          inherit system overlays;
        };
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [

            # core stack
            tmux
            git
            fish
            neovim
            podman

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
            ripgrep
            less

            # editing
            dprint
            tree-sitter

            # rust
            (rust-bin.stable.latest.default.override {
                extensions = ["rust-src" "rust-analyzer"];
            })

            # golang
            go
            gopls

            # python
            python3
            pyright
          ];

          shellHook = "tmux";

          EDITOR = "nvim";
          PAGER = "less";

          # fix for cargo https://nixos.wiki/wiki/Development_environment_with_nix-shell#Troubleshooting
          NIX_ENFORCE_PURITY = "0";

          # fix for git https://github.com/NixOS/nixpkgs/issues/58132
          GIT_SSH = "/usr/bin/ssh";
        };
      }
      );
}

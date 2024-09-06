{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
  let 
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in
  {
    devShells.x86_64-linux.default = pkgs.mkShell {
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

        # golang
        go
        gopls

        # rust
        cargo
        rustfmt
        rust-analyzer

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
  };
}

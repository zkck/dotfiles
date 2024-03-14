function dotfiles
    if test (count $argv) -gt 0
      git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME" $argv
    else
      lazygit --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"
    end
end

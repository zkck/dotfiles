if status is-interactive
    # Commands to run in interactive sessions can go here
end

abbr -a -- nv nvim
abbr -a -- c cargo
abbr -a -- k kubectl

set fish_greeting

zoxide init fish | source

call plug#begin()
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'

" LSP and autocomplete plugins
Plug 'neovim/nvim-lspconfig'

" Autocompletion
Plug 'hrsh7th/nvim-cmp'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'

Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.4' }

Plug 'savq/melange'

Plug 'lewis6991/gitsigns.nvim'

Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'

Plug 'mhartington/formatter.nvim'
call plug#end()

let mapleader = " "

set mouse=
set tabstop=4
set shiftwidth=4
set expandtab
set number
set relativenumber

set termguicolors
colorscheme melange

hi Normal guibg=NONE

augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END

" Remaining configurations is Lua
lua require('zkck')


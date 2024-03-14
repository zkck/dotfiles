require("nvim-tree").setup {
    update_focused_file = {
        enable = true,
    }
}

local api = require("nvim-tree.api")
vim.keymap.set({ 'n' }, '<leader>e', api.tree.open, {})

require('formatter').setup({
  filetype = {
    markdown = {
      function()
        return {
          exe = "dprint",
          args = {"fmt", "--stdin", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
          stdin = true
        }
      end
    },
  }
})

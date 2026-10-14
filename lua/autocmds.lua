require "nvchad.autocmds"

-- Treat hyphenated words (class names, CSS properties) as a single word in web filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "svelte",
    "html",
    "css",
    "scss",
    "less",
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
    "vue",
  },
  callback = function()
    vim.opt_local.iskeyword:append "-"
  end,
})

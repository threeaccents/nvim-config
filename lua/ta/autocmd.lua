vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "auto format on save",
  group = vim.api.nvim_create_augroup('lsp-formatting', {}),
  callback = function()
    vim.lsp.buf.format({ async = false })
  end
})


vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yaking (copying) text",
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

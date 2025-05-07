-- noremap = no recursive mapping, silent = no output for remap
local opts = { noremap = true, silent = true }

-- shorten function name
local keymap = vim.api.nvim_set_keymap

-- make space the leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- insert mode remaps
keymap("i", "jj", "<Esc>", opts)
keymap("i", ";;", "<Esc>la", opts)

-- normal mode remaps
keymap("n", "-", "<C-$>", opts)
keymap("n", "Y", "y$", opts)

-- diagnostic remaps
keymap("n", "<leader>se", "<cmd>lua require('vim.diagnostic').open_float()<CR>", opts)

-- telescope remaps
keymap("n", "<C-e>", "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
keymap("n", "<C-p>", "<cmd>lua require('telescope.builtin').git_files()<CR>", opts)
keymap("n", "<leader>pf", "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)

-- undotree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- fugitive
vim.keymap.set('n', '<leader>g', vim.cmd.Git)
vim.keymap.set('n', '<leader>gd', vim.cmd.Gvdiffsplit)
vim.keymap.set('n', '<leader>gbr', ":Git branch<Space>")
vim.keymap.set('n', '<leader>go', ":Git checkout<Space>")
vim.keymap.set('n', '<leader>gp', ":Git push<cr>")
vim.keymap.set('n', '<leader>gpl', ":Git pull<cr>")
vim.keymap.set('n', '<leader>gf', ":Git fetch<cr>")
vim.keymap.set('n', '<leader>gb', ":Git blame<cr>")
vim.keymap.set('n', '<leader>gme', ":Gvdiffsplit!<cr>")

-- neotest
vim.keymap.set('n', '<leader>t', "<cmd>lua require('neotest').run.run()<CR>''", opts)
vim.keymap.set('n', '<leader>to', "<cmd>lua require('neotest').output()<CR>''", opts)
vim.keymap.set('n', '<leader>tf', "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>''", opts)

-- Nvim Tree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Nvim Spectre (search and replace)
keymap("n", "<leader>f", "<cmd>lua require('spectre').open_visual()<CR>", opts)
keymap("n", "<leader>r", "<cmd>lua require('spectre.actions').run_replace()<CR>", opts)

-- Copilot rempaps
keymap("n", "<leader>cc", ":CopilotChat<CR>", opts)
keymap("v", "<leader>cc", ":CopilotChat<CR>", opts)
keymap("i", "`", ":Copilot#accept<CR>", opts)

-- disable arrow keys in all modes
for _, key in ipairs({ "<Up>", "<Down>", "<Left>", "<Right>" }) do
  keymap("i", key, "<Nop>", opts)
  keymap("v", key, "<Nop>", opts)
  keymap("n", key, "<Nop>", opts)
end

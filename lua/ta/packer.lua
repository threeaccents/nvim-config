-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim' -- Useful lua functions used ny lots of plugins

  -- Telescope
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.6' }
  use { "nvim-telescope/telescope-fzy-native.nvim" }

  -- Treesitter
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

  use 'mbbill/undotree'

  use 'tpope/vim-fugitive'

  -- lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {
        -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
    }
  }

  -- testing helpers
  use {
    "nvim-neotest/neotest",
    requires = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "jfpedroza/neotest-elixir"
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-elixir")
        }
      })
    end
  }

  -- AI
  use "github/copilot.vim"
  use {
    'CopilotC-Nvim/CopilotChat.nvim',
    requires = {
      { 'github/copilot.vim' },    -- or 'zbirenbaum/copilot.lua' if using Lua Copilot
      { 'nvim-lua/plenary.nvim' }, -- Required dependency
    },
    config = function()
      require("CopilotChat").setup()
    end
  }


  -- Nvim Tree (File Explorer)
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'

  -- autopairs
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  -- colorschemes
  use "sainnhe/everforest"

  -- search and replace
  use "nvim-pack/nvim-spectre"

  use "fatih/vim-go"

  -- comments
  use "terrortylor/nvim-comment"
end)

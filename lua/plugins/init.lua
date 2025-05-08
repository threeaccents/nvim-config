return {
    -- Lazy itself is not included here; it's assumed you've bootstrapped it in init.lua
  
    { "nvim-lua/plenary.nvim" },
  
    -- Telescope
    { "nvim-telescope/telescope.nvim", tag = "0.1.6", dependencies = { "nvim-lua/plenary.nvim" } },
    { "nvim-telescope/telescope-fzy-native.nvim" },
  
    -- Treesitter
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
        require("nvim-treesitter.configs").setup {
          ensure_installed = { "lua", "vim", "elixir" },
          highlight = { enable = true },
        }
      end,
    },
  
    -- Undo tree
    { "mbbill/undotree" },
  
    -- Git
    { "tpope/vim-fugitive" },
  
    -- Lualine
    {
      "nvim-lualine/lualine.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        require("lualine").setup()
      end,
    },
  
    -- LSP setup via lsp-zero
    {
      "VonHeikemen/lsp-zero.nvim",
      branch = "v2.x",
      dependencies = {
        { "neovim/nvim-lspconfig" },
        {
          "williamboman/mason.nvim",
          build = ":MasonUpdate",
        },
        { "williamboman/mason-lspconfig.nvim" },
        { "hrsh7th/nvim-cmp" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "L3MON4D3/LuaSnip" },
      },
    },
  
    -- Testing
    {
      "nvim-neotest/neotest",
      dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "jfpedroza/neotest-elixir"
      },
      config = function()
        require("neotest").setup {
          adapters = {
            require("neotest-elixir")
          }
        }
      end,
    },
  
    -- AI
    { "github/copilot.vim" },
    {
      "CopilotC-Nvim/CopilotChat.nvim",
      dependencies = {
        "github/copilot.vim",
        "nvim-lua/plenary.nvim",
      },
      config = function()
        require("CopilotChat").setup()
      end,
    },
  
    -- File Explorer
    { "nvim-tree/nvim-tree.lua" },
    { "nvim-tree/nvim-web-devicons" },
  
    -- Autopairs
    {
      "windwp/nvim-autopairs",
      config = function()
        require("nvim-autopairs").setup {}
      end,
    },
  
    -- Colorscheme
    { "sainnhe/everforest" },
  
    -- Search and Replace
    { "nvim-pack/nvim-spectre" },
  
    -- Go support
    { "fatih/vim-go" },
  
    -- Comments
    { "terrortylor/nvim-comment" },
  } 
  
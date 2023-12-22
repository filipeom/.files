-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use 'EdenEast/nightfox.nvim' -- Packer
  use 'rose-pine/neovim'
  use { 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } }
  use 'nvim-treesitter/playground'
  use 'mbbill/undotree'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-commentary'
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {                          -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      -- Plug 'hrsh7th/cmp-nvim-lsp'
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/nvim-cmp' },   -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'hrsh7th/cmp-vsnip' },
      { 'hrsh7th/vim-vsnip' },

    }
  }
  use 'romgrk/barbar.nvim'
  use 'nvim-tree/nvim-web-devicons'
  use 'wasp-platform/ecmasl-vim'
  use 'lervag/vimtex'
  use {
    "nvim-neorg/neorg",
    config = function()
      require('neorg').setup {
        load = {
          ["core.defaults"] = {},        -- Loads default behaviour
          ["core.concealer"] = {},       -- Adds pretty icons to your documents
          ["core.dirman"] = {            -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/doc/notes",
              },
            },
          },
        },
      }
    end,
    run = ":Neorg sync-parsers",
    requires = "nvim-lua/plenary.nvim",
  }
end)

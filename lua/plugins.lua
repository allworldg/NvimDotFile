return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
    "williamboman/nvim-lsp-installer",
    "neovim/nvim-lspconfig",
	}
  -- theme
  use ({ 'projekt0n/github-nvim-theme' })
  -- telescope (to find file)
  use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- nvim-treesiter
    use {
   'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
    }
  -- nvim-tree
   use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }
end)

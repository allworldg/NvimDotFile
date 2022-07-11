return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
    "williamboman/nvim-lsp-installer",
    "neovim/nvim-lspconfig",
	}
  -- theme
  use ({ 'projekt0n/github-nvim-theme' })
end)

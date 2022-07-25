-- if you have opt options
vim.cmd [[packadd packer.nvim]] 

return require('packer').startup({function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
    "williamboman/nvim-lsp-installer",
    "neovim/nvim-lspconfig",
  }

  -- theme
  use({ 'projekt0n/github-nvim-theme' })
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }


  --telescope (to find file)
   use {
     'nvim-telescope/telescope.nvim',tag="0.1.0",
      requires = { { 'nvim-lua/plenary.nvim' } }
   }
  -- nvim-treesiter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  -- nvim-tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
  }
  -- nvim-cmp
  use 'hrsh7th/cmp-nvim-lsp' -- { name = nvim_lsp }
  use 'hrsh7th/cmp-buffer' -- { name = 'buffer' },
  use 'hrsh7th/cmp-path' -- { name = 'path' }
  use 'hrsh7th/cmp-cmdline' -- { name = 'cmdline' }
  use 'hrsh7th/nvim-cmp'
  --use("hrsh7th/cmp-nvim-lsp-signature-help") -- { name = 'nvim_lsp_signature_help' }
  use ({"ray-x/lsp_signature.nvim"})

  -- vsnip
  use 'hrsh7th/cmp-vsnip' -- { name = 'vsnip' }
  use 'hrsh7th/vim-vsnip'
  use 'rafamadriz/friendly-snippets'

  -- lspkind
  use 'onsails/lspkind-nvim'

  -- autopairs
  use("windwp/nvim-autopairs")

  -- Comment
  use("numToStr/Comment.nvim")

  -- bufferline
  use({
     "akinsho/bufferline.nvim",
     requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" },
     -- cond = function () return true end 
   })
end,
config = {
  -- snapshot_path = require("packer.util").join_paths(vim.fn.stdpath("config"), "snapshots"),
  --   -- 这里锁定插件版本在v1，不会继续更新插件
  -- snapshot = "v1.json",
  max_jobs = 16,
  }
}
)

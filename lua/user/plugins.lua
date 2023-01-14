local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup({
  function(use)
    use 'wbthomason/packer.nvim'

    use { 'neovim/nvim-lspconfig', requires = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'j-hui/fidget.nvim',
        'folke/neodev.nvim',
      },
    }

    use { 'hrsh7th/nvim-cmp', requires = {
        'hrsh7th/cmp-nvim-lsp',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp-signature-help'
      },
    }

    use { 'nvim-treesitter/nvim-treesitter', run = function() pcall(require('nvim-treesitter.install').update { with_sync = true }) end }
    use { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' }

    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use 'lewis6991/gitsigns.nvim'

    use 'sainnhe/gruvbox-material'
    use 'xiyaowong/nvim-transparent'
    use 'nvim-lualine/lualine.nvim'
    use 'tpope/vim-sleuth'

    use { 'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup() end }
    use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end }

    use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

    if is_bootstrap then
      require('packer').sync()
    end
  end,
  config = {
    display = { open_fn = function() return require("packer.util").float({ border = 'single' }) end }
  }
})


vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- packer can manage itself
	use 'wbthomason/packer.nvim'
	use({
		'rose-pine/neovim',
		as = 'rose-pine',
		config = function()
			vim.cmd('colorscheme rose-pine')
		end
	})


    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use { 'junegunn/fzf', run = ":call fzf#install()" }
    use { 'junegunn/fzf.vim' }
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }

    use {
        "folke/zen-mode.nvim",
        config = function() require("zen-mode").setup {} end
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

end)

-- This file can be loaded by calling `lua require('plugins')` from your init.vim


-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    -- Packer can manage itself
    use('wbthomason/packer.nvim')

    -- theme
    use('folke/tokyonight.nvim')
    use('christianchiarulli/nvcode-color-schemes.vim')
    use("rebelot/kanagawa.nvim")
    use("bluz71/vim-nightfly-colors")

    -- file searching
    use("nvim-lua/plenary.nvim")
    use("nvim-telescope/telescope.nvim")
    use("nvim-telescope/telescope-media-files.nvim")
    use("BurntSushi/ripgrep")
    use("ThePrimeagen/harpoon")

    --LSP language processing
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

    --git stuff
    use("tpope/vim-fugitive")
    use {
      'lewis6991/gitsigns.nvim',
      config = function()
        require('gitsigns').setup()
      end
    }

    -- Indentation
    use("nvimtools/none-ls.nvim")

    -- Language specific
    use('JuliaEditorSupport/julia-vim')
    -- Other
    use("mbbill/undotree") -- search through undo branches
    --use("ryanoasis/vim-devicons")
    use("nvim-tree/nvim-web-devicons")
    use("echasnovski/mini.map")
    use("nvim-treesitter/nvim-treesitter", {run = ":TSUpdate"})
    use("nvim-treesitter/playground")
    use("nvim-lua/popup.nvim")
    use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
})
  end)

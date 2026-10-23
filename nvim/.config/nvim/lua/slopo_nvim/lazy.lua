-- lazy.nvim bootstrap: clones itself on a fresh machine
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none", "--branch=stable",
        "https://github.com/folke/lazy.nvim.git", lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Themes (color.lua picks nightfly; tokyonight's setup is also called there)
    { "bluz71/vim-nightfly-colors", name = "nightfly", priority = 1000 },
    { "folke/tokyonight.nvim", priority = 1000 },

    -- File searching
    { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    { "ThePrimeagen/harpoon", dependencies = { "nvim-lua/plenary.nvim" } },

    -- LSP, completion, snippets (configured in after/plugin/lsp.lua)
    { "mason-org/mason.nvim" },
    { "mason-org/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lua" },
    { "saadparwaiz1/cmp_luasnip" },
    { "L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets" } },

    -- Git
    { "tpope/vim-fugitive" },
    { "lewis6991/gitsigns.nvim", opts = {} },

    -- Treesitter (configured in after/plugin/treesitter.lua)
    { "nvim-treesitter/nvim-treesitter", branch = "main", lazy = false, build = ":TSUpdate" },

    -- Other
    { "mbbill/undotree" },
    { "nvim-tree/nvim-web-devicons" },
    { "echasnovski/mini.map" },
    { "kylechui/nvim-surround", version = "*", opts = {} },

    -- Julia support only where julia is installed (personal machine)
    { "JuliaEditorSupport/julia-vim", cond = vim.fn.executable("julia") == 1 },
}, {
    change_detection = { notify = false },
})

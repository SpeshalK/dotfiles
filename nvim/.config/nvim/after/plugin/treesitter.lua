require'nvim-treesitter.configs'.setup {
  -- Add the languages you use for research
  ensure_installed = { 
    "python", 
    "julia", 
    "cpp", 
    "bash", 
    "lua", 
    "vim", 
    "vimdoc", 
    "markdown", 
    "markdown_inline", 
    "latex", -- Helpful if you write papers in Neovim
    "c", 
    "rust" 
  },

  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  indent = {
    enable = true
  },
}

-- nvim-treesitter `main` branch (the old `master` setup{} API is gone).
-- Parsers are compiled locally: needs `tree-sitter-cli` and a C compiler.

local parsers = {
    "c", "cpp", "bash", "lua", "vim", "vimdoc",
    "markdown", "markdown_inline", "python", "latex", "rust",
}
if vim.fn.executable("julia") == 1 then
    table.insert(parsers, "julia")
end

require("nvim-treesitter").install(parsers)

-- Highlighting and indentation: switched on per buffer when a parser exists
vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
        if pcall(vim.treesitter.start, args.buf) then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
    end,
})

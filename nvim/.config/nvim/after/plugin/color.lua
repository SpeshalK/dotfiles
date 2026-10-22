require('tokyonight').setup({
    disable_background = true,
    border="#1de1e3",
    comment = "#eeeeee"
})

-- Color scheme
function ColorMyPencils(color)

    color=color or "nightfly"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0,"Normal",{bg="none"})
    vim.api.nvim_set_hl(0,"NormalFloat",{bg="none"})

end

ColorMyPencils()

-- CUSTOM COLORS

-- Text
vim.cmd([[highlight PreProc guifg=#80ffff guibg=NONE]])

-- visual mode
vim.cmd([[highlight Visual guifg=#e1b569 guibg=#144872]])

-- Comment & docstring 
vim.cmd([[highlight Comment guifg=#C81EB6 ctermbg=NONE]])
vim.cmd([[highlight @string.docstring.python guifg=#6080a0 gui=italic]])

-- Error messages
vim.cmd([[highlight Error guifg=#fc514e guibg=NONE]])
vim.cmd([[highlight ErrorMsg guifg=#fc514e guibg=NONE]])
vim.cmd([[highlight ErrorMsg guifg=#fc514e guibg=NONE]])
vim.cmd([[highlight NightflyRedAlert guifg=#fc514e guibg=NONE]])
vim.cmd([[highlight NightflyEmeraldAlert guifg=#21c7a8 guibg=NONE]])
vim.cmd([[highlight NightflyMalibuAlert guifg=#87bcff guibg=NONE]])
vim.cmd([[highlight NightflyOrangeAlert guifg=#f788c6c guibg=NONE]])
vim.cmd([[highlight DiagnosticSignError guifg=#db4b4b guibg=NONE]])

vim.cmd([[highlight DiagnosticVirtualTextWarn guifg=#e0af68 guibg=NONE]])
vim.cmd([[highlight DiagnosticVirtualTextError guifg=#db4b4b guibg=NONE]])
vim.cmd([[highlight DiagnosticVirtualTextInfo guifg=#0db9d7 guibg=NONE]])
vim.cmd([[highlight DiagnosticVirtualTextHint guifg=#1abc9c guibg=NONE]])

-- Sign column
vim.cmd([[highlight SignColumn guifg=#e0af68 guibg=NONE]])
vim.cmd([[highlight LineNr guifg=#3ff999 guibg=NONE]])
vim.cmd([[highlight LineNrAbove guifg=#a9d1b6 guibg=NONE]])
vim.cmd([[highlight LineNrBelow guifg=#a9d1b6 guibg=NONE]])
vim.cmd([[highlight GitSignsAddNr guifg=#a9d1b6 guibg=NONE]])
vim.cmd([[highlight NightflyWhiteAlert guifg=#c3ccdc guibg=NONE]])
vim.cmd([[highlight NightflyYellowAlert guifg=#e3d18a guibg=NONE]])

-- Status Line
vim.cmd([[highlight StatusLine guifg=#a9d1b6 guibg=#318b8e]])

-- Telescope
vim.cmd([[highlight FloatBorder guifg=#a9d1b6 guibg=NONE]])


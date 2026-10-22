vim.opt.guicursor= ""

-- Tabs & Indents
vim.opt.tabstop=4 
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab=true
vim.opt.smartindent=true

-- Settings
vim.opt.relativenumber=true
vim.opt.nu=true
vim.opt.hlsearch=false
vim.opt.hidden=true
vim.opt.errorbells=false --no fucking ringing
vim.opt.swapfile=false
vim.opt.undodir=os.getenv("HOME") .. "/.vim/undodir" --save backup files here
vim.opt.undofile=true
vim.opt.incsearch=true
vim.opt.scrolloff=8 --keep cursor centralized as you scroll
vim.opt.updatetime=50

-- Map leader
vim.g.mapleader = " "

-- Sign highlight colors
vim.cmd([[highlight SignColumn ctermbg=NONE]])
vim.cmd([[highlight DiffAdd ctermfg=4* ctermbg=NONE]])
vim.cmd([[highlight DiffChange ctermfg=LightYellow ctermbg=NONE]])
vim.cmd([[highlight DiffDelete ctermfg=DarkRed ctermbg=NONE]])

-- Autocompletion colors
vim.cmd([[highlight CocMenuSel ctermfg=120 ctermbg=18]])

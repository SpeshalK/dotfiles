-- File Search
vim.keymap.set("n","<leader>fs",vim.cmd.Ex)

-- Text editing
vim.keymap.set("v","<A-y>","\"+") -- Select clipboard for yank (press y again to yank selcted text)
--vim.keymap.set("n",",p","\"0p") -- paste last yaked text
--vim.keymap.set("n",",P","\"0P")
--vim.keymap.set("n","p",'"_dP') -- dont save pasted over text
vim.keymap.set("v","<","<gv") -- stay in indent mode until ESC
vim.keymap.set("v",">",">gv")
vim.keymap.set("v","<A-k>",":m .-2<CR>gv") -- down
vim.keymap.set("v","<A-j>",":m '>+1<CR>gv=gv") -- up

-- Spellcheck
vim.keymap.set("n","<C-s>c","<cmd>setlocal spell spelllang=en_gb<CR>")

-- Page jumping
vim.keymap.set("n","<C-u>","<C-u>zz")
vim.keymap.set("n","<C-d>","<C-d>zz")
vim.keymap.set("n","n","nzzzv")
vim.keymap.set("n","N","Nzzzv")

-- Minimap --
vim.keymap.set("n","<leader>mm","<cmd>lua MiniMap.toggle()<CR>")
vim.keymap.set("n","<leader>mr","<cmd>lua MiniMap.refresh()<CR>")
vim.keymap.set("n","<leader>mc","<cmd>lua MiniMap.close()<CR>")
vim.keymap.set("n","<leader>mf","<cmd>lua MiniMap.toggle_focus()<CR>")

-- VIM widow management
vim.keymap.set("n","<C-h>","<C-w>h")
vim.keymap.set("n","<C-j>","<C-w>j")
vim.keymap.set("n","<C-k>","<C-w>k")
vim.keymap.set("n","<C-l>","<C-w>l")
vim.keymap.set("n","<C-c>","<C-w>o")

-- Greek letters
vim.keymap.set("i", "<C-g>a", "α", { buffer = 0 })
vim.keymap.set("i", "<C-g>A", "A", { buffer = 0 })
vim.keymap.set("i", "<C-g>b", "β", { buffer = 0 })
vim.keymap.set("i", "<C-g>B", "B", { buffer = 0 })
vim.keymap.set("i", "<C-g>c", "χ", { buffer = 0 })
vim.keymap.set("i", "<C-g>C", "X", { buffer = 0 })
vim.keymap.set("i", "<C-g>d", "δ", { buffer = 0 })
vim.keymap.set("i", "<C-g>D", "Δ", { buffer = 0 })
vim.keymap.set("i", "<C-g>e", "ε", { buffer = 0 })
vim.keymap.set("i", "<C-g>E", "E", { buffer = 0 })
vim.keymap.set("i", "<C-g>1", "η", { buffer = 0 })
vim.keymap.set("i", "<C-g>!", "H", { buffer = 0 })
vim.keymap.set("i", "<C-g>g", "γ", { buffer = 0 })
vim.keymap.set("i", "<C-g>G", "Γ", { buffer = 0 })
vim.keymap.set("i", "<C-g>i", "\\iota", { buffer = 0 })
vim.keymap.set("i", "<C-g>I", "I", { buffer = 0 })
vim.keymap.set("i", "<C-g>k", "κ", { buffer = 0 })
vim.keymap.set("i", "<C-g>K", "K", { buffer = 0 })
vim.keymap.set("i", "<C-g>l", "λ", { buffer = 0 })
vim.keymap.set("i", "<C-g>L", "Λ", { buffer = 0 })
vim.keymap.set("i", "<C-g>m", "μ", { buffer = 0 })
vim.keymap.set("i", "<C-g>M", "M", { buffer = 0 })
vim.keymap.set("i", "<C-g>n", "v", { buffer = 0 })
vim.keymap.set("i", "<C-g>N", "N", { buffer = 0 })
vim.keymap.set("i", "<C-g>w", "ω", { buffer = 0 })
vim.keymap.set("i", "<C-g>O", "Ω", { buffer = 0 })
vim.keymap.set("i", "<C-g>f", "φ", { buffer = 0 })
vim.keymap.set("i", "<C-g>F", "Φ", { buffer = 0 })
vim.keymap.set("i", "<C-g>p", "ψ")
vim.keymap.set("i", "<C-g>P", "\\Psi", { buffer = 0 })
vim.keymap.set("i", "<C-g>3", "π", { buffer = 0 })
vim.keymap.set("i", "<C-g>#", "Π", { buffer = 0 })
vim.keymap.set("i", "<C-g>r", "ρ", { buffer = 0 })
vim.keymap.set("i", "<C-g>R", "R", { buffer = 0 })
vim.keymap.set("i", "<C-g>s", "σ", { buffer = 0 })
vim.keymap.set("i", "<C-g>S", "Σ", { buffer = 0 })
vim.keymap.set("i", "<C-g>t", "τ", { buffer = 0 })
vim.keymap.set("i", "<C-g>T", "T", { buffer = 0 })
vim.keymap.set("i", "<C-g>2", "θ", { buffer = 0 })
vim.keymap.set("i", "<C-g>@", "Θ", { buffer = 0 })
vim.keymap.set("i", "<C-g>u", "υ", { buffer = 0 })
vim.keymap.set("i", "<C-g>U", "\\Upsilon", { buffer = 0 })
vim.keymap.set("i", "<C-g>x", "ξ", { buffer = 0 })
vim.keymap.set("i", "<C-g>X", "Ξ", { buffer = 0 })
vim.keymap.set("i", "<C-g>z", "ζ", { buffer = 0 })
vim.keymap.set("i", "<C-g>Z", "Z", { buffer = 0 })

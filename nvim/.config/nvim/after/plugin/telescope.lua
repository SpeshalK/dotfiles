local builtin = require('telescope.builtin')
-- Smart Find: Searches Git files if in a repo, otherwise falls back to all files
local function smart_find()
    local opts = {}
    local ok = pcall(builtin.git_files, opts)
    if not ok then 
        builtin.find_files(opts) 
    end
end

-- Keymaps
vim.keymap.set('n', '<leader>ff', smart_find, { desc = "Smart Find Project Files" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live Grep (Search Text)" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find Open Buffers" })

-- Custom Grep Search
vim.keymap.set('n', '<leader>gs', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "Manual Grep Search" })

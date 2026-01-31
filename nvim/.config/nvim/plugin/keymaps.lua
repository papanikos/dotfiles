vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- jk escapes in Insert Mode
vim.keymap.set('i', 'jk', '<Esc>')

vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { silent = true, desc = '[N]ext buffer' })
vim.keymap.set('n', '<leader>bp', ':bprev<CR>', { silent = true, desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>bd', ':bdel<CR>', { silent = true, desc = 'Delete buffer' })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<leader>hn', ':Gitsigns next_hunk<CR>', { desc = 'Go to next hunk' })

vim.keymap.set('n', '<leader>f', function()
  require('conform').format { lsp_format = 'fallback', async = true }
end, { desc = '[F]ormat file' })

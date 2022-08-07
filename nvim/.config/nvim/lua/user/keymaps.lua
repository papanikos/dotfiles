-- Custom keymaps
vim.keymap.set("i", "jk", "<Esc>")

-- Disable highlght search
vim.keymap.set("n", "<leader>h", "<cmd>nohlsearch<cr>", {silent=true})

-- Faster window switch
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

-- Resize panes/windows
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize +2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- Telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader><cr>", "<cmd>noh<cr>")

-- nvim-tree
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")

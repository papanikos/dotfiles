-- Set colorscheme
vim.g.catppuccin_flavour = "mocha"
require("catppuccin").setup({
    term_colors = true,
})
vim.cmd("colorscheme catppuccin")

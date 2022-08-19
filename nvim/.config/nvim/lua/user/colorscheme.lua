-- Set colorscheme
vim.g.catppuccin_flavour = "mocha"
require("catppuccin").setup({
    integrations = {
        nvimtree = {
            enabled = true,
            show_root = true,
            transparent_panel = false,
        },
        gitsigns = true,
        treesitter = true,
        telescope = true,
    },
    color_overrides = {
        mocha = {
            text = "#EFF1F5"
        },
    }
})
vim.cmd("colorscheme catppuccin")

local configs = require("nvim-treesitter.configs")

configs.setup({
    ensure_installed = {
        "bash",
        "dockerfile",
        "json",
        "lua",
        "python",
        "toml",
        "yaml",
    },
    highlight = {
        enable = true
    },
    autopairs = {
        enable = true
    },
    indent = {
        enable = true,
    },
})

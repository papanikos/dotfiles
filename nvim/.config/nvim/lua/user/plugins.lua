-- Setup packer for plugins
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local install_plugins = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    print("Installing packer...")
    local packer_url = "https://github.com/wbthomason/packer.nvim"
    vim.fn.system({"git", "clone", packer_url, install_path})
    print("Done.")

    vim.cmd("packadd packer.nvim")
    install_plugins = true
end

require("packer").startup(function(use)
    -- Let packer handle packer
    use "wbthomason/packer.nvim"

    -- A lot of colorschemes
    --use "RRethy/nvim-base16"
    use { "catppuccin/nvim", as = "catppuccin" }

    -- Status line
    use "nvim-lualine/lualine.nvim"

    -- Buffers
    use { 'akinsho/bufferline.nvim', tag = "v2.*" }

    -- File explorer
    use { "kyazdani42/nvim-tree.lua",
            requires = { { "kyazdani42/nvim-web-devicons" } }
        }

    -- Git info
    use "lewis6991/gitsigns.nvim"

    -- Comment out lines
    use "numToStr/Comment.nvim"

    -- Highlgihting and more
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }

    -- Find stuff
    use {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        requires = { {"nvim-lua/plenary.nvim"} }
    }

    -- LSP
    -- Servers config
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "neovim/nvim-lspconfig"

    -- Auto-Completion
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    -- Snippets
    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"


    if install_plugins then
        require("packer").sync()
    end
end)

if install_plugins then
    return
end

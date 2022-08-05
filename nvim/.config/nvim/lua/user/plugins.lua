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
    use "wbthomason/packer.nvim"
    use "joshdick/onedark.vim"
    use "EdenEast/nightfox.nvim"
    use "nvim-lualine/lualine.nvim"
    use "tpope/vim-commentary"
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }
    use {
        "nvim-telescope/telescope.nvim", 
        tag = "0.1.0",
        requires = { {"nvim-lua/plenary.nvim"} }
    }

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

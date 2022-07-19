-- Setup packer for plugins
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local install_plugins = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  print('Installing packer...')
  local packer_url = 'https://github.com/wbthomason/packer.nvim'
  vim.fn.system({'git', 'clone', packer_url, install_path})
  print('Done.')

  vim.cmd('packadd packer.nvim')
  install_plugins = true
end

vim.api.nvim_create_user_command(
  'ReloadConfig',
  'source $MYVIMRC | PackerCompile',
  {}
)

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'joshdick/onedark.vim'
  use 'EdenEast/nightfox.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'tpope/vim-commentary'
  use 'sheerun/vim-polyglot'
  use 'nvim-treesitter/nvim-treesitter'
  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = { {'nvim-lua/plenary.nvim'} }
  }

  if install_plugins then
    require('packer').sync()
  end
end)

if install_plugins then
  return
end


-- Set leader key to space
vim.g.mapleader = ' '

-- General options
vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.colorcolumn = '79'
vim.opt.termguicolors = true
vim.opt.scrolloff = 5
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.splitbelow = true
vim.opt.splitright = true


-- Tab and spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Custom keymaps
vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')

vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader><cr>', '<cmd>noh<cr>')

-- Set colorscheme
vim.cmd('colorscheme nightfox')


-- Plugins setup

-- lualine
require('lualine').setup({
    options = {
	icons_enabled = true,
	theme = 'nightfox',
	component_separators = '|',
	section_separators = '',
	},
})

-- Telescope
require('telescope').setup()


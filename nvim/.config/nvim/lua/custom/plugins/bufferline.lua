return {
  'akinsho/bufferline.nvim',
  config = function()
    local bufferline = require 'bufferline'
    require('bufferline').setup {
      options = {
        numbers = 'buffer_id',
        style_preset = bufferline.style_preset.no_italic,
        separator_style = 'slant',
      },
    }
  end,
}

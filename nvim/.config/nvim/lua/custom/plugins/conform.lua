return { -- Autoformat
  'stevearc/conform.nvim',
  opts = {
    notify_on_error = false,
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      python = function()
        -- Disable ruff_fmt for the TLApp repo
        local git_out = vim.system({ 'git', 'rev-parse', '--show-toplevel' }, { text = true }):wait()
        if git_out ~= nil then
          local repo_path = git_out.stdout:gsub('\n', '')
          local repo_name = vim.system({ 'basename', repo_path }, { text = true }):wait()
          if repo_name.stdout:gsub('\n', '') == 'TLApp' then
            return {}
          end
        end
        return { 'ruff_format' }
      end,

      -- You can use a sub-list to tell conform to run *until* a formatter
      -- is found.
      -- javascript = { { "prettierd", "prettier" } },
    },
  },
}

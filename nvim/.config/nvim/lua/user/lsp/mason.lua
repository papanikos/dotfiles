require("mason").setup()
require("mason-lspconfig").setup()

local lspconfig = require("lspconfig")

local servers = {
    "pyright",
    "sumneko_lua",
    "bashls",
}

local opts = {}

for _, server in ipairs(servers) do
    opts = {
        on_attach = require("user.lsp.handlers").on_attach,
        capabilities = require("user.lsp.handlers").capabilities,
    }

    if server == "sumneko_lua" then
        local sumneko_opts = {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                            [vim.fn.stdpath "config" .. "/lua"] = true,
                        },
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
        }

        opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    end

    lspconfig[server].setup(opts)

end


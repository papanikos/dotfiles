require("mason").setup()
require("mason-lspconfig").setup()

local lspconfig = require("lspconfig")

local servers = {
    "pyright",
    "sumneko_lua",
}

local opts = {}

for _, server in ipairs(servers) do
    opts = {
        on_attach = require("user.lsp.handlers").on_attach,
        capabilities = require("user.lsp.handlers").capabilities,
    }
    lspconfig[server].setup(opts)

end

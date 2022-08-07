local lspconfig = require("lspconfig")
local servers = { "pyright" }

for _, server in ipairs(servers) do
    lspconfig[server].setup {}
end

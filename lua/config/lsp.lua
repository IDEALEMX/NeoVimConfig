local capabilities = vim.lsp.protocol.make_client_capabilities()
vim.lsp.config("*", { capabilities = capabilities })

vim.lsp.enable("lua_ls")
